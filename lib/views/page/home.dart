import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_number_app/controller/randomController.dart';
import 'package:group_button/group_button.dart';

class Home extends StatelessWidget {
  final Randomcontroller controller = Get.put(Randomcontroller());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF), 
      body: ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Choose Options Number generates",
              ),
              SizedBox(height: 10),
              Center(
                child: GroupButton(
                  buttons: ['Single', 'Custom'],
                  options: GroupButtonOptions(
                      buttonWidth: 180,
                      buttonHeight: 50,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      unselectedColor: Color(0xFFEDEDED),
                      selectedColor: Color(0XFF745982)),
                ),
              ),
              SizedBox(height: 10),
              Text("Enable Duplicate Number"),
              SizedBox(height: 10),
               Center(
                child: GroupButton(
                  buttons: ['None', 'Duplicate'],
                  options: GroupButtonOptions(
                      buttonWidth: 180,
                      buttonHeight: 50,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      unselectedColor: Color(0xFFEDEDED),
                      selectedColor: Color(0XFF745982)),
                ),
              ),
              SizedBox(height: 10),  
              Text("How many numbers?"),
              SizedBox(height: 10), 
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller.min,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                          filled: true,
                          fillColor: Colors.white,  
                          label: Text("Minimum")
                        ), 
                      ),  
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: TextField(
                        controller: controller.max,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                          filled: true,
                          fillColor: Colors.white,  
                          label: Text("Maximum"), 
                        ),  
                      ),  
                    ), 
                  ],
                ),
              ),   
              SizedBox(height: 10),   
              Center(
                child: Column(
                  children: [
                    Obx(() => Text(
                      controller.result.value,
                      style: TextStyle(fontSize: 90), 
                    ))
                  ]
                ), 
              ),
              SizedBox(height: 20),
              Center(
                  child: Container(
                decoration: BoxDecoration(
                  color: Color(0XFF745982),
                  borderRadius: BorderRadius.circular(5),
                ),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: () { 
                    controller.startRandomNumber();
                  },
                  child: Text(
                    'Start',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ))
            ],
          ),
        )
      ],
    ));
  }
}
