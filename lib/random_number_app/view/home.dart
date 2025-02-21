import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:learn_flutter_1/random_number_app/controllers/bottomBarController.dart';


class RandomNumberApp extends StatelessWidget {
  // final Bottombarcontroller bottombarcontroller = Get.put(Bottombarcontroller());
  
  RandomNumberApp({super.key});

  int _selectedIndex = 0;
  void _onItemTapped(index){ 
    _selectedIndex = index; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        title: Text("Random Number"),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10), 
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [ 
                  Text(
                    "Choose number", 
                    textAlign: TextAlign.end,
                  ), 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [  
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(3),
                            child: ElevatedButton( 
                              style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.greenAccent),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(color: Colors.greenAccent)
                                    )
                                  )
                              ),
                              child: Text(
                                "1-100"
                              ),
                              onPressed: () => {
                                
                              },  
                            ),
                        ),   
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(3),
                            child: ElevatedButton( 
                              style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.greenAccent),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(color: Colors.greenAccent)
                                    )
                                  )
                              ),
                              child: Text(
                                "1-1000"
                              ),
                              onPressed: () => {
                                
                              },  
                            ),
                        ),   
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(3),
                            child: ElevatedButton.icon(
                              icon: Icon(FontAwesomeIcons.gear),
                              onPressed: () => {
                                print("hello")
                              }, 
                              label: Text("Custom"),
                              style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.greenAccent),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(color: Colors.greenAccent)
                                    )
                                  )
                              ),
                            ),
                        ),   
                          
                      ),
                    ],
                  ),
                  Text(
                    "Select Option", 
                    textAlign: TextAlign.end,
                  ), 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [  
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(3),
                            child: ElevatedButton( 
                              style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.greenAccent),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(color: Colors.greenAccent)
                                    )
                                  )
                              ),
                              child: Text(
                                "Random Single"
                              ),
                              onPressed: () => {
                                
                              },  
                            ),
                        ),   
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(3),
                            child: ElevatedButton( 
                              style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.greenAccent),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(color: Colors.greenAccent)
                                    )
                                  )
                              ),
                              child: Text(
                                "Random Multiple"
                              ),
                              onPressed: () => {
                                
                              },  
                            ),
                        ),   
                      ),
                    ],
                  ),
                ],
              ), 
            ),
            Expanded( 
                child:Card(
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.amber
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: GetBuilder<Bottombarcontroller>(
        init: Bottombarcontroller(),
        builder: (controller){
          return BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: (index) => controller.changeIndex(index),
            items: [
              BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.home),label: "Home"),
              BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.history),label: "History"),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.gear),
                label: "Setting"
              )
            ],
          );
        }
      )
    );
  }
}
