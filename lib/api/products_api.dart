import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/models/product.dart';

class ProductsApi {
  Future<List<Product>?> getAllProducts() async {
    var client = http.Client();
    var uri = Uri.parse('https://api.escuelajs.co/api/v1/products');
    try {
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        return productsFromJson(const Utf8Decoder().convert(response.bodyBytes));
      }
      throw Exception("There are no products");
    } catch (e) {
      throw Exception("Failed to load products");
    }
  }
}
