import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vending_machine/Controller/MenuController.dart';
import 'package:vending_machine/model/MenuDto.dart';

class MenuBtn extends StatelessWidget {
  final MenuDto menu;
  const MenuBtn({Key? key, required this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildChoiceChip();
  }

  Widget buildChoiceChip() {
    Controller c = Get.put(Controller());

    print("Come Re Draw");
    return Scaffold(
      body: ChoiceChip(
        label: Container(
          width: Get.width,
          height: Get.height,
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
        selected: menu.check,
        onSelected: (select) {
          menu.check = select;
          c.updateItem(menu);
          c.menuSelect(menu.name, menu.price);
        },
      ),
    );
  }
}
