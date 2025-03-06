import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_number_app/controller/randomHistoryController.dart';

class Randomcontroller extends GetxController {
  Set<int> _generatedNumbers = Set<int>();

  final Randomhistorycontroller controller = Get.put(Randomhistorycontroller());

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

  /*GET HISTORY AFTER GENERATE*/
  List<String> history = [];
  /*END*/
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
       Get.defaultDialog(
        title: "Invalid number (Max: 100,000,000)",
        titleStyle: GoogleFonts.lato(
          fontSize: 17,
          color: Colors.black87
        ),
        backgroundColor: Colors.white,
        radius: 8,
        barrierDismissible: false,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.warning_amber_rounded, color: Colors.redAccent, size: 50),
            SizedBox(height: 10),
            Text(
              "Please enter a number below 100,000,000.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFF5F33E1),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                elevation: 2,
              ),
              child: Text("OK", style: TextStyle(fontSize: 16)),
              onPressed: () {
                Get.back();
                FocusScope.of(Get.context!).unfocus();
              },
            ),
          ],
        ),
      );
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
      String finalValue = "${minimum + Random().nextInt(maximum - minimum + 1)}";
      result.value = finalValue;
      controller.storeHistory(finalValue);
      
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
      titleStyle: GoogleFonts.lato(
          fontSize: 17,
          color: Colors.black87
      ),
      backgroundColor: Colors.white,
      radius: 8,
      barrierDismissible: false,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.info_outline_rounded, size: 50, color: Color(0xFF5F33E1)),
          SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFEDE8FF),
                      foregroundColor: Color(0xFF5F33E1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12),
                      elevation: 1,
                    ),
                    child: Text("Close", style: TextStyle(fontSize: 16)),
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
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12),
                      elevation: 2,
                    ),
                    icon: Icon(Icons.refresh, size: 20,color: Colors.white,),
                    label: Text("Again", style: TextStyle(fontSize: 16)),
                    onPressed: () {
                      _generatedNumbers.clear(); // Reset the generated numbers list
                      Get.back();
                      FocusScope.of(Get.context!).unfocus();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
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
  }
  /*END*/
}
