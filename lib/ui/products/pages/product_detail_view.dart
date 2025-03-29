import 'package:flutter/material.dart';
import 'package:myapp/models/product.dart';

class ProductDetailView extends StatelessWidget {
  final Product product;
  const ProductDetailView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      body: Center(child: Text('Product: ${product.title}')),
    );
  }
}
