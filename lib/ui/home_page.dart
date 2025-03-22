import 'package:flutter/material.dart';
import 'package:myapp/ui/products/all_products.dart';
import 'package:myapp/ui/home_appbar.dart';
import 'package:myapp/ui/shopping_list.dart';
import 'package:myapp/models/product.dart';
import 'package:myapp/services/products_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // for products logic
  late List<Product> products;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    final productsService = ProductsService();
    products = (await productsService.getAllProducts())!;
    setState(() {
      isLoaded = true;
    });
  }

  final List<Product> shoppingList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: HomeAppBar(),
      body:
          isLoaded
              ? AllProducts(products: products)
              : const Center(child: CircularProgressIndicator()),
      drawer: ShoppingList(),
    );
  }

  // List<Widget> getShoppingList() {
  //   List<Widget> list = [];
  //   for (final item in shoppingList) {
  //     list.add(
  //       ListTile(
  //         title: const Text('Home'),
  //         selected: _selectedIndex == 0,
  //         onTap: () {
  //           _onItemTapped(0);
  //           Navigator.pop(context);
  //         },
  //       ),
  //     );
  //   }
  //   return list;
  // }
}
