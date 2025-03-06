import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_number_app/views/page/setting.dart';

class Randomcontroller extends GetxController {
  Set<int> _generatedNumbers = Set<int>();

  // active button list number
  var listNumberActiveIcon = 0.obs;
  final min = TextEditingController(text: "1");
  final max = TextEditingController(text: "100");
  int minimum = 1;
  int maximum = 100;

  // active enable duplicate number
  var enableDuplicateNumber = 0.obs;
  void updateEnableDuplicateNumber(index) {
    enableDuplicateNumber.value = index;
  }

  RxString result = "1".obs;

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    minimum = int.parse(min.text);
    maximum = int.parse(max.text);
    update();
  }

  void reset() {
    min.text = "1";
    max.text = "100";
    minimum = 1;
    maximum = 100;
    result.value = "1";
  }

  /*START RANDOM NUMBER*/
  void randomNumber() {
    if (min.text.trim().isEmpty) {
      min.text = "1";
    }
    if (max.text.trim().isEmpty) {
      max.text = "100";
    }
    minimum = int.parse(min.text);
    maximum = int.parse(max.text);
    if (maximum > 100000000) {
      Get.defaultDialog();
    } else if (minimum < 1) {
      min.text = "1";
    } else {
      if (minimum > maximum) {
        max.text = "$minimum";
        min.text = "$maximum";
      } else if (enableDuplicateNumber.value == 1) {
        randomNoDuplicateNumber(minimum, maximum);
      } else {
        random(minimum, maximum);
      }
    }

    // ignore: unnecessary_null_comparison
    // if (minimum == null) {
    //   min;
    //   // ignore: unnecessary_null_comparison
    // } else if (maximum == null) {
    //   maximum = 100;
    // } else if (maximum > 100000000) {
    //   Get.defaultDialog();
    // }
    // if (minimum > maximum) {
    //   max.text = "$minimum";
    //   min.text = "$maximum";
    // } else if (enableDuplicateNumber.value == 1) {
    //   randomNoDuplicateNumber(minimum, maximum);
    // } else {
    //   random(minimum, maximum);
    // }
  }
  /*END*/

  /*START RANDOM NUMBER WITH DUPLICATE NUMBER*/
  void random(minimum, maximum) {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      result.value = "${minimum + Random().nextInt(maximum - minimum + 1)}";
    });

    Future.delayed(Duration(seconds: 1), () {
      _timer?.cancel();
      result.value = "${minimum + Random().nextInt(maximum - minimum + 1)}";
    });
  }
  /*END*/

  /*START RANDOM NUMBER WITHOUT DUPLICATE NUMBER*/
  void randomNoDuplicateNumber(int minimum, int maximum) {
    var rng = Random();
    int totalUniqueNumbers = maximum - minimum + 1;

    if (_generatedNumbers.length >= totalUniqueNumbers) {
      Get.defaultDialog(
        title: "All numbers have been generated",
        barrierDismissible: false,
        titleStyle: TextStyle(fontSize: 13),
        content: GestureDetector(
          child: Column(
            children: [
              Icon(
                Icons.info_outline_rounded,
                size: 80,
                color: Color(0xFF5F33E1),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFEDE8FF),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      child: Text("Close"),
                      onPressed: () {
                        Get.back();
                        FocusScope.of(Get.context!).unfocus();
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF5F33E1),
                        foregroundColor: Color(0xFFEDE8FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      icon: Icon(
                        Icons.refresh,
                        color: Color(0xFFEDE8FF),
                      ),
                      label: Text("Again"),
                      onPressed: () {
                        _generatedNumbers
                            .clear(); // Reset the generated numbers list
                        Get.back();
                        FocusScope.of(Get.context!).unfocus();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        radius: 5,
      );
      return;
    }

    int rngNumber;
    do {
      rngNumber = minimum + rng.nextInt(maximum - minimum + 1);
    } while (_generatedNumbers.contains(rngNumber));

    _generatedNumbers.add(rngNumber);

    _timer?.cancel();
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      int randomDuringAnimation = minimum + rng.nextInt(maximum - minimum + 1);
      result.value = randomDuringAnimation.toString();
    });

    Future.delayed(Duration(seconds: 1), () {
      _timer?.cancel();
      result.value = rngNumber.toString();
    });

    print(result.value);
  }
  /*END*/
}
