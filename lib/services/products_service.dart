import 'package:myapp/api/products_api.dart';
import 'package:myapp/models/product.dart';

class ProductsService {
  final _api = ProductsApi();
  Future<List<Product>?> getAllProducts() async {
    try {
      final products = await _api.getAllProducts();
      return products;
    } catch (e) {
      return [];
    }
  }

  Future<List<Product>?> getProductsByCategory(int id) async {
    try {
      final products = await _api.getProductsByCategory(id);
      return products;
    } catch (e) {
      return null;
    }
  }
}
