import 'package:flutter/material.dart';

class ShoppingList extends StatefulWidget {
  const ShoppingList({
    super.key,
  });

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.black),
            child: Text(
              'Shopping List',
              style: TextStyle(color: Colors.white),
            ),
          ),
          // ...getShoppingList(),
        ],
      ),
    );
  }
}