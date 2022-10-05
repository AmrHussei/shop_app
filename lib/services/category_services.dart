import 'package:http/http.dart' as http;
import '../model/category_model.dart';
import '../model/product_model.dart';
import '../utils/my_string.dart';

class CategoryServices {
  static Future<List<String>> getCategory() async {
    http.Response response =
        await http.get(Uri.parse("${baseUrl}products/categories"));

    if (response.statusCode == 200) {
      String jsonData = response.body;
      print('product services===================');
      return categoryModelFromJson(jsonData);
    } else {
      return throw Exception('Failed to load product');
    }
  }

  static Future<List<ProductModel>> getSpecificCategory(
      String Categoryname) async {
    http.Response response =
        await http.get(Uri.parse("${baseUrl}products/category/$Categoryname"));

    if (response.statusCode == 200) {
      String jsonData = response.body;
      print('category services===================');
      return productModelFromJson(jsonData);
    } else {
      return throw Exception('Failed to load product');
    }
  }
}
