import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vending_machine/Controller/Controller.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  child: GridView.count(
                    padding: EdgeInsets.all(20),
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: [
                      menu("햄버거", "5000"),
                      menu("커피", "2000"),
                      menu("콜라", "1000"),
                      menu("아이스크림", "1500"),
                      menu("짜장면", "5500"),
                      menu("짬뽕", "6000"),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text("메뉴"),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: Text("가격"),
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
                    onPressed: () {},
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

  Container menu(String menu, String price) {
    bool selected = false;
    Controller menuCon = Get.put(Controller());
    return Container(
      color: Colors.grey,
      child: Align(
        child: MaterialButton(
          minWidth: double.infinity,
          onPressed: () => (),
          child: Text(
            "시작하기",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
