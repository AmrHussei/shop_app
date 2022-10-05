import 'package:http/http.dart' as http;

import '../model/product_model.dart';
import '../utils/my_string.dart';

class ProductServices {
 static Future<List<ProductModel>> getProduct() async {
   http.Response response = await http.get(Uri.parse("${baseUrl}products"));

   if(response.statusCode ==200){
    String jsonData = response.body;
      print('product services===================');
    return productModelFromJson(jsonData);
  
   }else{
    return throw Exception('Failed to load product');
   }
  }
}
