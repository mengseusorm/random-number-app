import 'package:get/get.dart';

class ButtonController extends GetxController {
var isActive = false.obs; // Observable variable

  void toggleActive() {
    isActive.value = !isActive.value;
  }
}