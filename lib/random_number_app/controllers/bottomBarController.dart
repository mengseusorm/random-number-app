import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_flutter_1/random_number_app/view/history.dart';
import 'package:learn_flutter_1/random_number_app/view/setting.dart';
import 'package:learn_flutter_1/random_number_app/view/home.dart';

class Bottombarcontroller extends GetxController {
  var selectedIndex = 0.obs;

  @override
  void onInit() { 
    super.onInit();
  }

  void changeIndex(int index) {
    selectedIndex.value = index;
    if (index == 2) {
      Get.to(() => Setting(), transition: Transition.rightToLeft);
    }
    switch(index){ 
        case 0:
            Get.to(() => RandomNumberApp());
            break;
        case 1:
            Get.to(() => History(),transition: Transition.rightToLeft);
            break;
        case 2:
            Get.to(() => Setting(),transition: Transition.rightToLeft );
            break;
    }
  }
}
