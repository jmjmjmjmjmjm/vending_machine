import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vending_machine/Controller/MenuController.dart';
import 'package:vending_machine/Page/PayingPage.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Controller c = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('계산금액'),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  c.menuString.value,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Text(
                  c.priceInt.value.toString() + " 원",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                          height: 40,
                          color: Colors.grey[200],
                          onPressed: () {
                            c.payment = "card";
                            c.paying();
                            Get.to(PayingPage());
                          },
                          child: Text("카드"),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                          height: 40,
                          color: Colors.grey[200],
                          onPressed: () {
                            c.payment = "money";
                            c.visibility.value = 0.8;
                          },
                          child: Text("현금"),
                        ),
                      ),
                    ),
                  ],
                ),
                Obx(() => Opacity(
                    opacity: c.visibility.value,
                    child: ChoiceChip(
                      label: Text('현금영수증 발급시 클릭'),
                      selected: c.moneyOk.value,
                      onSelected: c.moneyOk,
                    ))),
                Obx(
                  () => Opacity(
                    opacity: c.visibility.value,
                    child: TextFormField(
                        textAlign: TextAlign.center,
                        onSaved: null,
                        validator: null,
                        decoration: InputDecoration(hintText: '번호입력')),
                  ),
                ),
                Obx(
                  () => Opacity(
                    opacity: c.visibility.value,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MaterialButton(
                              color: Colors.grey[200],
                              onPressed: () {
                                c.paying();
                                Get.to(PayingPage());
                              },
                              child: Text('결제하기'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
