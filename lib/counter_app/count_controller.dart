import 'package:get/get.dart';

class CountController extends GetxController {  
  int count = 0;
  @override
  void onInit() { 
    super.onInit();
  }
  void increment(){
    count++;
    update();
  }

  void descremet(){
    count--;
    if(count < 0){
      count = 0;
    }
    update();
    
  }
  
}