import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_number_app/controller/randomController.dart';
import 'package:group_button/group_button.dart';

class Home extends StatelessWidget {
  final OptionContoller controller = Get.put(OptionContoller());

  List<Widget> optionRandomNumbers = <Widget>[
    Text('Single'),
    Text('Multiple'),
    Text('Custorm')
  ];
  bool vertical = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [  
            Center(
              child: GroupButton( 
                buttons: [
                  "Single",
                  "Multiple",
                  "Custom",
                ],
              ), 
            ) ,
            Center(
              
            )
            // Expanded(
            //   child: GroupButton(
            //     buttons: ["Button 1", "Button 2", "Button 3"],
            //   ),
            // )
          ],
        ),
      )
    );
  }
}
