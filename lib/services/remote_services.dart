import 'package:http/http.dart' as http;
import 'package:shopx/models/product.dart';

class RemoteServices {
  static Future<List<Product>?> fetchProducts() async {
    var response = await http.get(Uri.parse(
        'http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
    if (response.statusCode == 200) {
      var jsonString = response.body;

      return productFromJson(jsonString);
    } else {
      return null;
    }
  }
}
