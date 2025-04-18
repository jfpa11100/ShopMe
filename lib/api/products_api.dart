import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/models/product.dart';

class ProductsApi {
  Future<List<Product>?> getAllProducts() async {
    final client = http.Client();
    final uri = Uri.parse('https://api.escuelajs.co/api/v1/products');
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

  Future<List<Product>?> getProductsByCategory(int id) async {
    final client = http.Client();
    final uri = Uri.parse('https://api.escuelajs.co/api/v1/products/?categoryId=$id');
    try {
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        return productsFromJson(const Utf8Decoder().convert(response.bodyBytes));
      }
      throw Exception("There are no products for the category");
    } catch (e) {
      throw Exception("Failed to load products");
    }
  }
}
