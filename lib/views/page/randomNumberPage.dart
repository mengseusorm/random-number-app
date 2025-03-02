import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:random_number_app/controller/randomController.dart'; 
import 'package:random_number_app/views/page/history.dart';
import 'package:random_number_app/views/page/home.dart';
import 'package:random_number_app/views/page/setting.dart'; 
class Randomnumberpage extends StatefulWidget {
  @override
  _RandomnumberpageState createState() => _RandomnumberpageState();
}

class _RandomnumberpageState extends State<Randomnumberpage> {
  final Randomcontroller controller = Get.put(Randomcontroller());
  int _page = 0;

  final List<Widget> pages = [
    Home(),
    History(),
    Text("Setting"),    
    SettingsPage2(), 
  ];

  void _navbar(int index) {
    setState(() {
      _page = index;
    });
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xFF5F33E1),
        title: Text(
          "Generate Number Pro", 
          style: TextStyle(
            color: Colors.white
          ),
        ), 
        actions:[
          IconButton(
            onPressed: () => {
              controller.refresh()
            },  
            icon: Icon(FontAwesomeIcons.refresh),
            color: Colors.white,
          )
        ] 
      ),
      body: pages[_page], // Make sure this updates correctly
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Color(0xFF5F33E1),
        index: _page,
        onTap: _navbar,
        items: [
          Icon(
            Icons.home_outlined ,
            color: Colors.white, 
          ),
          Icon(
            Icons.history_outlined,
            color: Colors.white, 
          ),
          Icon(
            Icons.share_outlined,
            color: Colors.white, 
          ),
          Icon(
            Icons.settings_outlined,
            color: Colors.white, 
          ),
        ],
      ),
    );
  }
}
