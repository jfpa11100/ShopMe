import 'package:myapp/api/products_api.dart';
import 'package:myapp/models/product.dart';

class ProductsService {
  final _api = ProductsApi();
  Future<List<Product>?> getAllProducts() async {
    try {
      return _api.getAllProducts();
    } catch (e) {
      return [];
    }
  }

  Future<List<Product>?> getProductsByCategory(int id) async {
    try {
      return _api.getProductsByCategory(id);
    } catch (e) {
      return null;
    }
  }
}
