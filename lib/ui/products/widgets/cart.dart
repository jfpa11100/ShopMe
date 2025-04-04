import 'package:flutter/material.dart';
import 'package:myapp/providers/shopping_list_provider.dart';
import 'package:myapp/ui/products/widgets/cart_product_item.dart';
import 'package:myapp/ui/products/widgets/discount_input.dart';
import 'package:myapp/ui/products/widgets/full_width_btn.dart';
import 'package:myapp/ui/products/widgets/purchase_container.dart';
import 'package:provider/provider.dart';

class ShoppingList extends StatefulWidget {
  const ShoppingList({super.key});

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 25.0,
            ),
            color: const Color.fromRGBO(26, 26, 26, 0.95),
            child: const Text(
              'Shopping list',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Consumer<CartProvider>(
                    builder: (context, cartProvider, child) {
                      return ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        scrollDirection: Axis.vertical,
                        itemCount: cartProvider.shoppingList.length,
                        itemBuilder: (context, index) {
                          final product = cartProvider.shoppingList[index];
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CartProductItem(product: product),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 25.0,
            ),
            child: Column(
              children: [
                DiscountInput(),
                PurchaseContainer(),
                FullWidthBtn(text: 'Make a purchase', onPressedAction: (){
                  // Implement make a purchase action
                },)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
