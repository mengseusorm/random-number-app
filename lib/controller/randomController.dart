import 'package:get/get.dart';

class OptionContoller extends GetxController { 
  RxList<bool> selectedOptions = [true, false, false].obs;
  void toggleOption(int index) {
    // selectedOptions[index] = !selectedOptions[index];

      for (int i = 0; i < selectedOptions.length; i++) {
        selectedOptions[i] = i == index;
      }
  }
}
