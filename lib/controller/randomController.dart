import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Randomcontroller extends GetxController { 
  final min = TextEditingController(text: "1"); 
  final max = TextEditingController(text: "100");


  int minimum = 1; 
  int maximum = 100;
  
  RxString result = "1".obs;

  Timer? _timer;

  @override
  void onInit(){
    super.onInit(); 
    minimum = int.parse(min.text);
    maximum = int.parse(max.text);
    update();
  }

  void refresh() { 
    min.text = "1";
    max.text = "100"; 
    minimum = 1;
    maximum = 100;  
    result.value = "1";
  }

  void startRandomNumber () {
    minimum = int.parse(min.text);
    maximum = int.parse(max.text); 
    
    if(minimum > maximum){
      max.text = "$minimum";
      min.text = "$maximum"; 
    }
    animateRandom();
    random(minimum, maximum);
  }  

  void random(minimum,maximum){ 
      var rng = minimum + Random().nextInt(maximum - minimum + 1);
      result.value = rng.toString();
  }

  void animateRandom() {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      result.value = "${minimum + Random().nextInt(maximum - minimum + 1)}";
    });

    Future.delayed(Duration(seconds: 1), () {
      _timer?.cancel();
      result.value = "${minimum + Random().nextInt(maximum - minimum + 1)}";
    });
  }
}
