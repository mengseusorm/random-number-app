import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_number_app/controller/randomController.dart';

class Home extends StatelessWidget {
  final OptionContoller controller = Get.put(OptionContoller());

  List<Widget> fruits = <Widget>[
    Text('Apple'),
    Text('Banana'),
    Text('Orange')
  ];
  bool vertical = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( 
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("selected"),
              Padding(
                padding: EdgeInsets.all(10),
                child: Obx(() => ToggleButtons(
                  direction: vertical ? Axis.vertical : Axis.horizontal,
                  isSelected: controller.selectedOptions,
                  onPressed: (index) => {
                    controller.toggleOption(index)
                  },
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  selectedBorderColor: Colors.red[700],
                  selectedColor: Colors.white,
                  fillColor: Colors.red[200],
                  color: Colors.red[400],
                  constraints: const BoxConstraints(minHeight: 40.0, minWidth: 80.0),
                  children: fruits,
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
