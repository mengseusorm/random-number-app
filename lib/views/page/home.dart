import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_number_app/controller/randomController.dart';
import 'package:group_button/group_button.dart';
import 'package:toggle_switch/toggle_switch.dart';

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
             Card(
                color:Color(0xFFFFFFFF),
                elevation: 1,
                margin: EdgeInsets.zero,  
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)), 
                ),child: Padding( 
                  padding: EdgeInsets.all(10), 
                    child: Container(
                      width: double.infinity, 
                      child: Center( 
                        child: ToggleSwitch( 
                          minWidth: double.infinity, 
                          cornerRadius: 5.0,
                          activeBgColors: [[Color(0xFF5F33E1)!], [Color(0xFF5F33E1)!]],
                          activeFgColor: Colors.white,
                          inactiveBgColor: Color(0xFFEDE8FF),
                          inactiveFgColor: Color(0xFF5F33E1),
                          initialLabelIndex: 0,
                          totalSwitches: 2,
                          labels: ['Single', 'Custom'],
                          radiusStyle: true,
                          onToggle: (index) {
                            print('switched to: $index');
                          },
                        ),
                      ),
                    ),
                ), 
              ), 
              SizedBox(height: 10),     
              Text("Enable Duplicate Number"),
              SizedBox(height: 10), 
              Card(
                color:Color(0xFFFFFFFF),
                elevation: 1,
                margin: EdgeInsets.zero,  
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))
                ),child: Padding(
                  padding: EdgeInsets.all(10), 
                    child: Container(
                      width: double.infinity, 
                      child: Center( 
                        child: ToggleSwitch( 
                          minWidth: double.infinity, 
                          cornerRadius: 5.0,
                          activeBgColors: [[Color(0xFF5F33E1)!],[Color(0xFF5F33E1)!]],
                          activeFgColor: Colors.white,
                          inactiveBgColor: Color(0xFFEDE8FF),
                          inactiveFgColor: Color(0xFF5F33E1),
                          initialLabelIndex: 0,
                          totalSwitches: 2,
                          labels: ['None', 'Duplicate'],
                          radiusStyle: true,
                          onToggle: (index) {
                            print('switched to: $index');
                          },
                        ),
                      ),
                    ),
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
                            borderRadius: BorderRadius.all(Radius.circular(5)), 
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF5F33E1), width: 2)
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(color: Color(0xFF5F33E1), width: 1),  // Border color when enabled
                          ),
                          filled: true,
                          fillColor: Colors.white,  
                          label: Text("Minimum"),  
                        ), 
                        style: TextStyle(
                          fontSize: 17
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
                            borderRadius: BorderRadius.all(Radius.circular(5)), 
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF5F33E1), width: 2)
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(color: Color(0xFF5F33E1), width: 1),  // Border color when enabled
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
                  color: Color(0xFF5F33E1),
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
