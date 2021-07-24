import 'package:get/get.dart';

class Controller extends GetxController {
  var selected = false.obs;
  var list = {
    "햄버거": false,
    "커피": false,
    "콜라": false,
    "아이스크림": false,
    "짜장면": false
  };
  toggle() => selected.value = selected.value ? false : true;
}
