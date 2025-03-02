import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
      ),
      body:Container( 
        child: ListView.builder(
          itemCount: 30,
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
                          "1111111111111",
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