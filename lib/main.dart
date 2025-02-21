import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_flutter_1/random_number_app/view/home.dart';  
void main(){
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: RandomNumberApp(),
    );
  }
}
