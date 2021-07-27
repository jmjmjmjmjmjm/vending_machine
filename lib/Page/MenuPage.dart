import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vending_machine/Controller/MenuController.dart';
import 'package:vending_machine/Page/PaymentPage.dart';
import 'package:vending_machine/model/MenuDto.dart';
import 'package:vending_machine/object/MenuBtn.dart';
import 'package:vending_machine/object/PlaBtn.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Controller c = Get.put(Controller());
    c.arr.add(MenuDto("햄버거", 5000, false));
    c.arr.add(MenuDto("피자", 6000, false));
    c.arr.add(MenuDto("콜라", 1000, false));
    c.arr.add(MenuDto("아이스크림", 5000, false));
    c.arr.add(MenuDto("과자", 6000, false));
    c.arr.add(MenuDto("사이다", 1000, false));

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  child: Obx(
                    () => GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 3 / 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20),
                      itemCount: c.arr.length,
                      itemBuilder: (_, idx) => MenuBtn(menu: c.arr[idx]),
                      padding: EdgeInsets.all(20),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Obx(() => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(c.menuString.value),
                        )),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: Obx(() => Text(c.priceInt.toString() + "원")),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: MaterialButton(
                    color: Colors.grey,
                    minWidth: double.infinity,
                    onPressed: () => Get.to(PaymentPage()),
                    child: Text(
                      "메뉴선택 완료",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
