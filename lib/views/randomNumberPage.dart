import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:learn_flutter_1/views/page/history.dart';
import 'package:learn_flutter_1/views/page/setting.dart';

class Randomnumberpage extends StatefulWidget {
  @override
  _RandomnumberpageState createState() => _RandomnumberpageState();
}

class _RandomnumberpageState extends State<Randomnumberpage> {
  int _page = 0;

  final List<Widget> pages = [
    Center(
      child: Text(
        "Hello1",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ),
    History()
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
        backgroundColor: Colors.deepPurple,
        title: Text(
          "Generate Random Number",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton( 
          onPressed: () => { 
            Get.to(() =>SettingsPage2())
          }, 
          icon: Icon(Icons.settings),
          color: Colors.white,
          ),
      ),
      body: pages[_page], // Make sure this updates correctly
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.deepPurple,
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
