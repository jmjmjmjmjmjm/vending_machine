import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vending_machine/Controller/MenuController.dart';

class PayingPage extends StatelessWidget {
  const PayingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Controller c = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            c.reset();
            Get.back();
          },
        ),
        centerTitle: true,
        title: Text('계산'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '주문음식',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
              Text(
                c.menuString.value,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 40,
              ),
              Text('가격',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
              Text(
                c.priceInt.toString(),
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                '내가 낸금액',
                style: TextStyle(fontSize: 40),
              ),
              Obx(() => Text(
                    c.m.value.toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
              Obx(() => Text(c.state.toString()))
            ],
          ),
        ),
      ),
    );
  }
}
