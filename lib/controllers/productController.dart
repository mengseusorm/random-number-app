import 'dart:convert';

import 'package:get/get.dart';
import 'package:learn_flutter_1/model/product_model.dart';
import 'package:http/http.dart' as http;

class Productcontroller extends GetxController {

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  var isLoading = false.obs;
  List<Product> products  = [];

  fetchData() async {
    try {
      isLoading(true);
      http.Response response = await http.get(Uri.tryParse('https://fakestoreapi.com/products')!);
      if(response.statusCode == 200){
         var result = jsonDecode(response.body); // Decoding the response
          products = (result as List).map((item) => Product.fromJson(item)).toList(); // Parsing list

          // Printing each product object
          for (var product in products) {
            print("Title: ${product.title}, Price: \$${product.price}");
          }
      }
    } catch (e) {
      print("error fetching data");
    } finally {
      isLoading(false);
    }
  }
}