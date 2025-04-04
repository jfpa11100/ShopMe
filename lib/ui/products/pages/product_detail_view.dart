import 'package:flutter/material.dart';
import 'package:myapp/models/product.dart';
import 'package:myapp/providers/shopping_list_provider.dart';
import 'package:myapp/ui/products/widgets/full_width_btn.dart';
import 'package:provider/provider.dart';

class ProductDetailView extends StatefulWidget {
  final Product product;

  const ProductDetailView({super.key, required this.product});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  int imageChoosed = 0;
  void changeImage(int index) {
    setState(() {
      imageChoosed = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Product product = widget.product;
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Product', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                product.images[imageChoosed],
                width: 290,
                height: 270,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image(
                    image: const AssetImage('images/noImage.png'),
                    width: 290,
                    height: 270,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(product.images.length, (index) {
              return GestureDetector(
                onTap: () {
                  changeImage(index);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    width: 65,
                    height: 66,
                    decoration: BoxDecoration(
                      color:
                          index == imageChoosed
                              ? Colors.white
                              : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border:
                          index == imageChoosed
                              ? Border.all(color: Colors.white, width: 4)
                              : null,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Image.network(
                        product.images[index],
                        width: index == imageChoosed ? 63 : 65,
                        height: index == imageChoosed ? 64 : 66,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image(
                            image: const AssetImage('images/noImage.png'),
                            width: index == imageChoosed ? 63 : 65,
                            height: index == imageChoosed ? 64 : 66,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
            decoration: BoxDecoration(
              color: Color.fromRGBO(26, 26, 26, 0.950),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10,
                  ),
                  child: ProductTitlePrice(product: product),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Description',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          overflow: TextOverflow.ellipsis,
                          leadingDistribution: TextLeadingDistribution.even,
                        ),
                      ),
                      TextButton.icon(
                        label: Text(
                          'Show more',
                          style: TextStyle(color: Colors.white),
                        ),
                        icon: Icon(
                          Icons.arrow_drop_down_sharp,
                          color: Colors.white,
                          size: 24.0,
                          semanticLabel: 'Show More',
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            backgroundColor: Color.fromRGBO(26, 26, 26, 0.950),
                            context: context,
                            builder: (BuildContext context) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15.0,
                                  horizontal: 20.0,
                                ),
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 15.0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Description',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        product.description,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 0.0,
                  ),
                  child: FullWidthBtn(
                    text: 'Add to cart',
                    onPressedAction: () {
                      cartProvider.toggleAddToCart(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Product added to from cart')),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductTitlePrice extends StatelessWidget {
  const ProductTitlePrice({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            product.title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            maxLines: 2,
            overflow: TextOverflow.visible,
          ),
        ),
        const SizedBox(width: 20),
        Text(
          '\$ ${product.price.toString()}',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
