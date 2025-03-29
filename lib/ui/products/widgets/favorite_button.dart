import 'package:flutter/material.dart';
import 'package:myapp/models/product.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({
    super.key,
    required this.parentWidth,
    required this.parentHeight,
    required this.product,
  });
  final double parentWidth;
  final double parentHeight;
  final Product product;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
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
        boxShadow: [
          boxShadow,
        ],
      ),
      child: IconButton(
        color: (isFavorite) ? const Color(0xFFDB3022) : const Color(0xFF9B9B9B),
        icon: (isFavorite) ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border),
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
      ),
    );
  }
}