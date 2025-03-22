import 'package:flutter/material.dart';
import 'package:myapp/ui/products/product_item.dart';
import 'package:myapp/models/product.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1 / 1.73,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
            ),
            children: [
              ...List.generate(
                products.length,
                (index) => ProductItem(product: products[index]),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: const CustomBottomNavigationBar(
      //   currentIndex: 0,
      // ),
    );
  }
}
