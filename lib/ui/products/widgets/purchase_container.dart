import 'package:flutter/material.dart';
import 'package:myapp/providers/shopping_list_provider.dart';
import 'package:provider/provider.dart';

class PurchaseContainer extends StatelessWidget {
  const PurchaseContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              Consumer<CartProvider>(
                builder: (context, cartProvider, child) {
                  final subtotal = cartProvider.subtotal.toString();
                  return Text(
                    '\$ ${subtotal == '0.0' ? '0' : subtotal}',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  );
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              Consumer<CartProvider>(
                builder: (context, cartProvider, child) {
                  final total = cartProvider.subtotal.toString();
                  return Text(
                    '\$ ${total == '0.0' ? '0' : total}',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
