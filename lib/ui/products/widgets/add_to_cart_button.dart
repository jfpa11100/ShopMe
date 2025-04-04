import 'package:flutter/material.dart';
import 'package:myapp/models/product.dart';
import 'package:myapp/providers/shopping_list_provider.dart';
import 'package:provider/provider.dart';

class AddToCartBtn extends StatefulWidget {
  const AddToCartBtn({
    super.key,
    required this.parentWidth,
    required this.parentHeight,
    required this.product,
  });
  final double parentWidth;
  final double parentHeight;
  final Product product;

  @override
  State<AddToCartBtn> createState() => _AddToCartBtnState();
}

class _AddToCartBtnState extends State<AddToCartBtn> {
  @override
  Widget build(BuildContext context) {
    Product product = widget.product;
    final cartProvider = Provider.of<CartProvider>(context);
    final isInCart = cartProvider.isInCart(product);

    final boxShadow = BoxShadow(
      color: const Color(0xFF9B9B9B),
      blurRadius: widget.parentWidth * 0.0001,
      spreadRadius: widget.parentWidth * 0.001,
      offset: Offset(0, widget.parentWidth * 0.005),
    );

    return Container(
      width: widget.parentWidth * 0.22,
      height: widget.parentHeight * 0.13,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFFFFFFF),
        boxShadow: [boxShadow],
      ),
      child: IconButton(
        color: (isInCart) ? const Color.fromRGBO(26, 26, 26, 0.950) : const Color(0xFF9B9B9B),
        icon:
            (isInCart)
                ? const Icon(Icons.shopping_cart)
                : const Icon(Icons.shopping_cart_outlined),
        onPressed: () {
          cartProvider.toggleAddToCart(product);
        },
      ),
    );
  }
}
