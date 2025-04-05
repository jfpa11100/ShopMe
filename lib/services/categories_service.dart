import 'package:myapp/api/categories_api.dart';
import 'package:myapp/models/category.dart';

class CategoriesService {
  final _api = CategoriesApi();
  Future<List<Category>?> getAllCategories() async {
    try {
      return _api.getAllCategories();
    } catch (e) {
      return [];
    }
  }
}