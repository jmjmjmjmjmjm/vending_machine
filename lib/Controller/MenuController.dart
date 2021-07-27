import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';
import 'package:vending_machine/Page/MenuPage.dart';
import 'package:vending_machine/Page/StartPage.dart';
import 'package:vending_machine/Page/SucessPage.dart';
import 'package:vending_machine/main.dart';
import 'package:vending_machine/model/MenuDto.dart';

class Controller extends GetxController {
  var state = "".obs;
  var m = 0.obs;
  var _timer = Timer.periodic(Duration(seconds: 0), (timer) {});
  var savePhoneNumber = "";
  var moneyOk = false.obs;
  var visibility = 0.0.obs;
  var payment = "";

  var menuString = "".obs;
  var priceInt = 0.obs;
  var menus = [""].obs;

  var arr = <MenuDto>[].obs;

  menuSelect(String menu, int p) {
    if (menus.contains(menu) == false) {
      print("메뉴추가" + menu);
      menus.add(menu);
      menuString.value += " " + menu;
      priceInt += p;
    } else {
      print("메뉴삭제" + menu);
      menus.remove(menu);
      priceInt -= p;
      menuString.value = "";
      for (int i = 0; i < menus.length; i++) {
        menuString.value += " " + menus[i];
      }
    }
  }

  paying() {
    if (payment == "card") {
      card();
    }
    if (payment == "money") {
      money();
    }
  }

  money() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      int my = (Random().nextInt(1000) + 1) * 10;
      if (m.value < my) m.value = my.toInt();
      if (m.value > priceInt.value) {
        timer.cancel();
        state.value = (m.value - priceInt.value).toString() + "잔돈입니다";
        timeToSucess();
      }
    });
  }

  card() {
    print("int2 실행");
    _timer = Timer(Duration(seconds: 5), () {
      int my = (Random().nextInt(1000) + 1) * 10;
      m.value = my.toInt();
      if (m.value > priceInt.value) {
        state.value = "결제되었습니다";
        timeToSucess();
      } else {
        state.value = "잔액부족";
      }
    });
  }

  timeToSucess() {
    Timer(Duration(seconds: 5), () {
      Get.offAll(SucessPage());
      timeToMain();
    });
  }

  updateItem(MenuDto menu) {
    this.arr.refresh();
  }

  timeToMain() {
    Timer(Duration(seconds: 8), () {
      m.value = 0;
      state.value = "";
      Get.offAll(StartPage());
    });
  }
}
