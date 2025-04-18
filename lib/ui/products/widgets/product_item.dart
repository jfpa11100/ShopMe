import 'package:flutter/material.dart';
import 'package:myapp/models/product.dart';
import 'package:myapp/ui/products/pages/product_detail_view.dart';
import 'package:myapp/ui/products/widgets/add_to_cart_button.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 4,
      height: 3,
      child: LayoutBuilder(
        builder: (_, constraints) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailView(product: product),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        child: Hero(
                          tag: product.id,
                          child: Image.network(
                            product.images[0],
                            width: constraints.maxWidth * 0.92,
                            height: constraints.maxHeight * 0.75,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image(
                                image: const AssetImage('images/noImage.png'),
                                width: constraints.maxWidth * 0.92,
                                height: constraints.maxHeight * 0.75,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        left: constraints.maxWidth / 1.32,
                        top: constraints.maxHeight / 1.56,
                        child: AddToCartBtn(
                          parentWidth: constraints.maxWidth,
                          parentHeight: constraints.maxHeight,
                          product: product,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.02),
                SizedBox(height: constraints.maxHeight * 0.02),
                Text(
                  product.description,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF9B9B9B),
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.02),
                Text(
                  product.title,
                  maxLines: 1,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 16,
                    color: Color.fromARGB(255, 233, 233, 233),
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.01),
                Text(
                  '\$${product.price}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
