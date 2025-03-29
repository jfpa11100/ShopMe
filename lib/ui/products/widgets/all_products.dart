import 'package:flutter/material.dart';
import 'package:myapp/ui/products/widgets/product_item.dart';
import 'package:myapp/models/product.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount =
        screenWidth < 600
            ? 2 // Phones
            : screenWidth < 900 ? 3 // Small tablets
            : 4; // Larger tablets or desktops
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GridView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1 / 1.73,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: crossAxisCount,
          ),
          children: [
            ...List.generate(
              products.length,
              (index) => ProductItem(product: products[index]),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: const CustomBottomNavigationBar(
      //   currentIndex: 0,
      // ),
    );
  }
}
