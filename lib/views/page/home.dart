import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_number_app/controller/randomController.dart';
import 'package:group_button/group_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Home extends StatelessWidget {
  final OptionContoller controller = Get.put(OptionContoller());  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column( 
          mainAxisSize: MainAxisSize.max, 
          children: [  
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10), 
                child: Card( 
                  color: Colors.white,
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity, // Full size
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                            Text(
                              "How many number for random ?",
                              textAlign: TextAlign.start,
                            ),  
                            SizedBox(
                              height: 20,
                            ),
                            GroupButton(
                              buttons: ["Single", "Mutiple", "Custom"], 
                              // Use buttonBuilder to customize each button
                              buttonBuilder: (selected, button, context) {
                                IconData icon;
                                // Assign different icons based on the button text
                                if (button == "Single") {
                                  icon = Icons.looks_one_sharp;
                                } else if (button == "Mutiple") {
                                  icon = Icons.looks_two_sharp;
                                } else {
                                  icon = Icons.settings;
                                } 
                                return Container(
                                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: selected ? Colors.blue : Colors.white,
                                    border: Border.all(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        icon,
                                        size: 20,
                                        color: selected ? Colors.white : Colors.blue,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        button,
                                        style: TextStyle(
                                          color: selected ? Colors.white : Colors.blue,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              options: GroupButtonOptions(
                                spacing: 10,
                                selectedColor: Colors.blue,
                                unselectedColor: Colors.white,
                                selectedTextStyle: TextStyle(color: Colors.white),
                                unselectedTextStyle: TextStyle(color: Colors.blue),
                                borderRadius: BorderRadius.circular(8),
                                selectedBorderColor: Colors.blue,
                                unselectedBorderColor: Colors.blue,
                              ),
                            ), 
                        ],
                      ),
                    ),
                  ),

                )
              ),
            ),  
            Expanded(
              child: Card(
                color: const Color.fromARGB(255, 43, 30, 29),
                child: SizedBox(  
                  width: 200,
                  height: 200,
                ),
              )
            ),  
            Expanded(
              child: Card(
                color: Colors.red,
                child: SizedBox(  
                  width: 200,
                  height: 200,
                ),
              )
            ),  
          ],
        ),
      )
    );
  }
}
