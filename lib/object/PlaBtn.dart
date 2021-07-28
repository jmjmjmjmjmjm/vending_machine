import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:vending_machine/Controller/MenuController.dart';
import 'package:vending_machine/model/MenuDto.dart';

class PlaBtn extends GetWidget<Controller> {
  final MenuDto menu;
  const PlaBtn({Key? key, required this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Controller c = Get.put(Controller());
    return Scaffold(
      body: Obx(
        () => Container(
          // color: c.color.value,
          width: Get.width,
          height: Get.height,
          child: MaterialButton(
            onPressed: () {
              menu.check = !menu.check;
              // c.updateItem(menu);
              c.menuSelect(menu.name, menu.price);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(menu.name),
                SizedBox(
                  height: 5,
                ),
                Text(menu.price.toString() + " 원")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
