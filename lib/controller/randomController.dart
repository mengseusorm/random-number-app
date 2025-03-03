import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_number_app/views/page/setting.dart';

class Randomcontroller extends GetxController {
  // bool isButton1Active = true;

  // active button list number
  var listNumberActiveIcon = 0.obs;
  void updatelistNumberActiveIcon(index){ 
    listNumberActiveIcon.value = index;
    if(listNumberActiveIcon.value == 1) {
      alertCustomListNumber();
    }
  }

  void alertCustomListNumber () {
    Get.defaultDialog(
      backgroundColor: Colors.white,
      title: "Alert",
      middleText: "This is", 
      buttonColor:Color(0xFF5F33E1),
      cancelTextColor: Color(0xFF5F33E1),
      radius: 5,
      
      confirm: Container( 
        decoration: BoxDecoration(
          color: Color(0xFF5F33E1), // Button background color
          borderRadius: BorderRadius.circular(5), // Border radius for button
        ),
        child: TextButton(
          onPressed: () {
            print("hello");
          },
          child: Text(
            "Confirm",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      cancel: Container( 
        decoration: BoxDecoration(
          color: Color(0xFFEDE8FF), // Button background color
          borderRadius: BorderRadius.circular(5), // Border radius for button
        ),
        child: TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            "Cancel",
            style: TextStyle(color: Color(0xFF5F33E1)),
          ),
        ),
      )
    ); 
  }

  // active enable duplicate number
  var enableDuplicateNumber = 0.obs;
  void updateEnableDuplicateNumber(index){
    enableDuplicateNumber.value = index;
  }


  final min = TextEditingController(text: "1");
  final max = TextEditingController(text: "100");

  int minimum = 1;
  int maximum = 100;

  RxString result = "1".obs;

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    minimum = int.parse(min.text);
    maximum = int.parse(max.text);
    update();
  }

  void setting() {
    Get.to(() => Setting_page());
  }

  void refresh() {
    min.text = "1";
    max.text = "100";
    minimum = 1;
    maximum = 100;
    result.value = "1";
  }

  void startRandomNumber() {
    minimum = int.parse(min.text);
    maximum = int.parse(max.text);

    if (minimum > maximum) {
      max.text = "$minimum";
      min.text = "$maximum";
    }
    animateRandom();
    random(minimum, maximum);
  }

  void random(minimum, maximum) {
    var rng = minimum + Random().nextInt(maximum - minimum + 1);
    result.value = rng.toString();
  }

  void animateRandom() {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      result.value = "${minimum + Random().nextInt(maximum - minimum + 1)}";
    });

    Future.delayed(Duration(seconds: 1), () {
      _timer?.cancel();
      result.value = "${minimum + Random().nextInt(maximum - minimum + 1)}";
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
