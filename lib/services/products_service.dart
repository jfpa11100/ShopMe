import 'package:myapp/api/products_api.dart';
import 'package:myapp/models/product.dart';

class ProductsService {
  final _api = ProductsApi();
  Future<List<Product>?> getAllProducts() async {
    return _api.getAllProducts();
  }

  Future<List<Product>?> getProductsByCategory(int id) async {
    return _api.getProductsByCategory(id);
  }
}