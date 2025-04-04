import 'package:flutter/material.dart';
import 'package:myapp/models/category.dart';
import 'package:myapp/models/product.dart';
import 'package:myapp/services/products_service.dart';
import 'package:myapp/ui/products/widgets/all_products.dart';

class CategoryView extends StatefulWidget {
  final Category category;
  const CategoryView({super.key, required this.category});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  late List<Product> products;
  bool areProductsLoaded = false;

  @override
  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    final productsService = ProductsService();
    products =
        (await productsService.getProductsByCategory(widget.category.id))!;
    setState(() {
      areProductsLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Category category = widget.category;
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.black,
      body:
          areProductsLoaded
              ? Center(child: AllProducts(products: products))
              : const Center(child: CircularProgressIndicator()),
    );
  }
}
