import 'package:flutter/material.dart'; 
import 'package:getwidget/getwidget.dart';
import 'package:random_number_app/views/page/randomNumberPage.dart';
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
