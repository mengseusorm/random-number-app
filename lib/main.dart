import 'package:flutter/material.dart'; 
import 'package:getwidget/getwidget.dart';
import 'package:learn_flutter_1/views/randomNumberPage.dart';
import 'package:get/get.dart'; 

void main(){
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Randomnumberpage(),
    );
  }
}
