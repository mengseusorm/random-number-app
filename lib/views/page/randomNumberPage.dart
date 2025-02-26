import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_number_app/core/app_theme.dart'; 
import 'package:random_number_app/views/page/history.dart';
import 'package:random_number_app/views/page/home.dart';
import 'package:random_number_app/views/page/setting.dart';

class Randomnumberpage extends StatefulWidget {
  @override
  _RandomnumberpageState createState() => _RandomnumberpageState();
}

class _RandomnumberpageState extends State<Randomnumberpage> {
  int _page = 0;

  final List<Widget> pages = [
    Home(),
    History(),
  ];

  void _navbar(int index) {
    setState(() {
      _page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Generate Random Number",
          style: TextStyle(
            color: Colors.black,
            fontSize: 15
          ), 
        ),
        centerTitle: true,
        actions:[
          IconButton( 
            onPressed: () => { 
              Get.to(() =>SettingsPage2())
            }, 
            icon: Icon(Icons.settings),
            color: Colors.black, 
          ), 
        ] 
      ),
      body: pages[_page], // Make sure this updates correctly
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.blue,
        index: _page,
        onTap: _navbar,
        items: [
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.history, color: Colors.white),
        ],
      ),
    );
  }
}
