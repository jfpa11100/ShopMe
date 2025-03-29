import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/models/category.dart';

class CategoriesApi {
  Future<List<Category>?> getAllCategories() async {
    final client = http.Client();
    final uri = Uri.parse('https://api.escuelajs.co/api/v1/categories');
    try {
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        return categoriesFromJson(const Utf8Decoder().convert(response.bodyBytes));
      }
      throw Exception("There are no categories");
    } catch (e) {
      throw Exception("Failed to load categories");
    }
  }
}
