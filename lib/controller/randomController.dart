import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_number_app/views/page/setting.dart';

class Randomcontroller extends GetxController {
  // bool isButton1Active = true;

  // active button list number
  var listNumberActiveIcon = 0.obs;
  // void updatelistNumberActiveIcon(index){ 
  //   listNumberActiveIcon.value = index;
  //   if(listNumberActiveIcon.value == 1) {
  //     alertCustomListNumber();
  //   }
  // }

  RxDouble minSlider = 1.0.obs;
  RxDouble maxSlider = 100.0.obs;
  RxDouble _valueSlider = 1.0.obs; 
  RxInt dividerSlide = 100.obs;
  // alert customer list number
  // void alertCustomListNumber() {
  //   Get.defaultDialog(
  //     backgroundColor: Colors.white, 
  //     title:"How many list number?",
  //     titleStyle: TextStyle(
  //       fontSize: 15
  //     ),
  //     content: Column( 
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Row(
  //           children: [
  //             Text("1", style: GoogleFonts.mandali(fontSize: 15) ),
  //             Expanded(
  //               child: Obx(() =>  Slider(
  //                 value: _valueSlider.value,
  //                 min: minSlider.value,
  //                 max: maxSlider.value,
  //                 divisions: dividerSlide.value,
  //                 label: _valueSlider.round().toString(),
  //                 onChanged: (double newValue) { 
  //                     upateSlider(newValue);
  //                 },
  //               ),)
  //             ),
  //             Text("100", style: GoogleFonts.mandali(fontSize: 15) ),
  //           ],
  //         ),
  //         Row(
  //            children: [
  //               Expanded(
  //                 child: ElevatedButton(
  //                   style: ElevatedButton.styleFrom(
  //                     backgroundColor: Color(0xFFEDE8FF),
  //                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5) ),
  //                   ),
  //                   onPressed: () => {

  //                       _valueSlider.value = 1.0,Get.back(),
  //                   }, 
  //                   child: Text("Cancel",style: TextStyle(color: Color(0xFF5F33E1)),
  //                   )
  //                 ),
  //               ),
  //               SizedBox(width: 10),
  //               Expanded(
  //                 child: ElevatedButton(
  //                   style: ElevatedButton.styleFrom(
  //                     backgroundColor: Color(0xFF5F33E1),
  //                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),
  //                   ),
  //                   onPressed: () => {
  //                     Get.back(),
  //                   }, 
  //                   child: Text("Confirm",style: TextStyle(color: Colors.white),
  //                   )
  //                 ),
  //               ),
  //             ],
  //         ),
  //       ],
  //     ), 
  //     radius: 5,
  //   );
  // }
  // update slider value 
  void upateSlider(double value){
    _valueSlider.value = value; 
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

    int numberList = _valueSlider.value.toInt(); 
    if(numberList >= 1){
      for (var i = 1; i < numberList; i++) {
        random(minimum, maximum);
      }
    } else {
      animateRandom();
      random(minimum, maximum);
    }
  }

  void random(minimum, maximum) {
    var rng = minimum + Random().nextInt(maximum - minimum + 1);
    result.value = rng.toString();
    print(rng);
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
