import 'package:flutter/material.dart';
import 'package:myapp/models/category.dart';
import 'package:myapp/services/categories_service.dart';
import 'package:myapp/ui/categories/widgets/all_categories.dart';
import 'package:myapp/ui/products/widgets/all_products.dart';
import 'package:myapp/ui/home_appbar.dart';
import 'package:myapp/ui/products/widgets/cart.dart';
import 'package:myapp/models/product.dart';
import 'package:myapp/services/products_service.dart';
import 'package:myapp/ui/products/widgets/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // for products logic
  late List<Product> products;
  late List<Category> categories;
  bool areCategoriesLoaded = false;
  bool areProductsLoaded = false;

  @override
  void initState() {
    super.initState();
    loadCategories();
    loadProducts();
  }

  Future<void> loadProducts() async {
    final productsService = ProductsService();
    products = (await productsService.getAllProducts())!;
    setState(() {
      areProductsLoaded = true;
    });
  }

  Future<void> loadCategories() async {
    final categoriesService = CategoriesService();
    categories = (await categoriesService.getAllCategories())!;
    setState(() {
      areCategoriesLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: HomeAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 7.0),
            child: SearchBarProducts(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(7.0, 10.0, 7.0, 5.0),
            child:
                areCategoriesLoaded
              ? categories.isNotEmpty
                  ? Center(child: AllCategories(categories: categories))
                  : Center(
                    child: Text(
                      'No categories found',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
              : const Center(child: CircularProgressIndicator()),
          ),
          Expanded(
            child:
                areProductsLoaded
                    ? products.isNotEmpty
                        ? Center(child: AllProducts(products: products))
                        : Center(
                          child: Text(
                            'No products. Make sure you are conected to interfet and reload the app',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                    : const Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
      drawer: ShoppingList(),
    );
  }
}
