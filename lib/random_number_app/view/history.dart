import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:learn_flutter_1/random_number_app/controllers/bottomBarController.dart';
import 'package:learn_flutter_1/random_number_app/view/home.dart';

class History extends StatelessWidget {
  final Bottombarcontroller bottombarcontroller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => {
          bottombarcontroller.changeIndex(0),
          Get.offAll(() => RandomNumberApp())
        },
        icon: Icon(
          FontAwesomeIcons.arrowLeft
        )),
      ),
    );
  }
}