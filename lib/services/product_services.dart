

import 'package:course_getx/utils/my_string.dart';
import 'package:http/http.dart'as http;
import '../model/product_model.dart';

class ProductServices{


static Future <List<ProductModel>> getProducts()async{
 var response=  await http.get(Uri.parse('$baseUrl/products'));
 if(response.statusCode ==200){
 var jsonData=  response.body;
 return productModelFromJson(jsonData);
 }else{
   return throw Exception("Failed to load product");
 }
  }
}