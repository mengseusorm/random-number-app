import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_number_app/controller/randomHistoryController.dart';

class History extends StatelessWidget {
  
  final Randomhistorycontroller controller = Get.put(Randomhistorycontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("History"),
      ),
      body:Container(  
        child: ListView.builder(
          itemCount: controller.history.length,
          itemBuilder: (context ,index) {
            return Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.history[index],
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            print("copy");
                          },
                          icon: Icon(Icons.copy),
                          iconSize: 17,
                        ),
                      ],
                    ),
                    Divider(), // Adds a horizontal line as a divider
                  ],
                ),
              );
          }, 
        )
      )
    ); 
  }
}