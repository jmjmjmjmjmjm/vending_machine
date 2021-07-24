import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vending_machine/MenuPage.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Center(
                      child: Text(
                    "자판기",
                    style: TextStyle(fontSize: 40),
                  ))),
              Expanded(
                flex: 1,
                child: MaterialButton(
                  minWidth: double.infinity,
                  color: Colors.pink[100],
                  onPressed: () => Get.to(MenuPage()),
                  child: Text(
                    "시작하기",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
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
