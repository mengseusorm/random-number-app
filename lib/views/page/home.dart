import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_number_app/controller/randomController.dart'; 
import 'package:toggle_switch/toggle_switch.dart';

class Home extends StatelessWidget {
  final Randomcontroller controller = Get.put(Randomcontroller());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF), 
      body: GestureDetector(
        onTap: () => {
          FocusScope.of(context).unfocus()
        },
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // enalbe duplicate number
                  SizedBox(height: 20),     
                  Text("Enable Duplicate Number"),
                  SizedBox(height: 10), 
                  Card(
                    color:Color(0xFFFFFFFF),
                    elevation: 1,
                    margin: EdgeInsets.zero,  
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))
                    ),child: Padding(
                      padding: EdgeInsets.all(10), 
                        child: Container(
                          width: double.infinity, 
                          child: Center( 
                            child: Obx(() => 
                              ToggleSwitch( 
                                minWidth: double.infinity, 
                                cornerRadius: 4.0,
                                activeBgColor: [Color(0xFF5F33E1)],
                                activeFgColor: Colors.white,
                                inactiveBgColor: Color(0xFFEDE8FF),
                                inactiveFgColor: Color(0xFF5F33E1),
                                initialLabelIndex: controller.enableDuplicateNumber.value,
                                totalSwitches: 2,
                                labels: ['Duplicate Number', 'None'],
                                radiusStyle: true,
                                customIcons: [ 
                                  Icon(
                                    CupertinoIcons.square_on_square,
                                    color: controller.enableDuplicateNumber == 0 ? Colors.white : Color(0xFF5F33E1),
                                  ),
                                  Icon(
                                    CupertinoIcons.nosign,
                                    color: controller.enableDuplicateNumber == 1 ? Colors.white : Color(0xFF5F33E1),
                                  ), 
                                ],
                                onToggle: (index) { 
                                  controller.updateEnableDuplicateNumber(index);
                                },
                              ),
                            ) 
                          ),
                        ),
                    ), 
                  ),  
                  // short number 
                  SizedBox(height: 20),  
                  Text("How many numbers?"),
                  SizedBox(height: 10), 
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller.min,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)), 
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
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),  
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: TextField(
                          controller: controller.max,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)), 
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
                          style: TextStyle(
                            fontSize: 17, 
                          ),   
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ), 
                      ), 
                    ],
                  ),   
                  SizedBox(height: 10),   
                  Center(
                    child: Column(
                      children: [
                        Obx(() => Text(
                          // number generate here
                          controller.result.value,
                          style: GoogleFonts.mandali(
                            fontSize: 90,
                          ), 
                        ))
                      ]
                    ), 
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF5F33E1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8), // Adjust radius as needed
                          ),
                        ),
                        onPressed: () { 
                          controller.randomNumber();
                        },
                        child: Text(
                          'Generate',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                    ),
                  ))
                ],
              ),
            )
          ],
        )
      )
    );
  }
}
