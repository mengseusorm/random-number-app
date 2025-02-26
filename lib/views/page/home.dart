import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_number_app/controller/randomController.dart';

class Home extends StatelessWidget { 
  final ButtonController controller = Get.put(ButtonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(10),
            child: Obx(() => ElevatedButton(
              onPressed: controller.toggleActive,
              style: ElevatedButton.styleFrom(
                backgroundColor: controller.isActive.value ? Colors.green : Colors.blue, 
              ),
              child: Text(controller.isActive.value ? "Active" : "Inactive"),
            )),
        ),
        
    );
  }
}