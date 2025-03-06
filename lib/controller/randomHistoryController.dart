import 'package:get/get.dart';
import 'package:random_number_app/views/page/history.dart';

class  Randomhistorycontroller extends GetxController {

  List<String> history = [];

  @override
  void onInit() {
    super.onInit();
    update();
  }  

  /*store history after random*/
  void storeHistory(data){
    history.add(data);
  }
  /*end*/

  void showHistory(){ 
    for (var element in history) {
      print(element);
    }
  }
}