
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_flutter_1/counter_app/count_controller.dart';

class CountApp extends StatelessWidget {
  const CountApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: GetBuilder<CountController>(
        init: CountController(),
        builder: (controller){ 
         return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  controller.count.toString()
                ), 
                FloatingActionButton(
                  child: Text("increment"),
                  onPressed: (){
                    controller.increment();
                }),
                FloatingActionButton(
                  child: Text("descreas"),
                  onPressed: (){
                    controller.descremet();
                }),
              ], 
            ),
          );
        } 
      ),
      bottomNavigationBar: GetBuilder<CountController>(builder: ,),
    );
  }
}