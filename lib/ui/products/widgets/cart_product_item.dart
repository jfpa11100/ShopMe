import 'package:flutter/material.dart';
import 'package:myapp/models/product.dart';
import 'package:myapp/providers/shopping_list_provider.dart';
import 'package:myapp/ui/products/widgets/quantity_selector.dart';
import 'package:provider/provider.dart';

class CartProductItem extends StatelessWidget {
  const CartProductItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Dismissible(
      key: Key(product.id.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        cartProvider.toggleAddToCart(product);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${product.title} removed from cart')),
        );
      },
      background: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromRGBO(250, 205, 202, 1.0),
        ),
        alignment: Alignment.centerRight,
        child: const Icon(
          Icons.delete_outline_outlined,
          color: Colors.red,
          size: 30,
        ),
      ),
      child: ListTile(
        tileColor: Color.fromRGBO(26, 26, 26, 0.95),
        minTileHeight: 105.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            height: 75,
            product.images[0],
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.broken_image, color: Colors.white);
            },
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.title,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            QuantitySelector(),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.edit_outlined, color: Colors.grey, size: 17),
            Text(
              '\$ ${product.price}',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
