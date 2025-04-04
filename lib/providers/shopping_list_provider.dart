import 'package:flutter/material.dart';
import 'package:myapp/models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _shoppingList = [];
  double _subtotal = 0.0;
  double _total = 0.0;

  List<Product> get shoppingList => _shoppingList;

  double get subtotal {
    if (_shoppingList.isEmpty) {
      _subtotal = 0.0;
    }
    return _subtotal;
  }

  double get total {
    if (_shoppingList.isEmpty) {
      _total = 0.0;
    }
    return _total;
  }

  set total(double value) {
    if (value <= 0) {
      _total = 0.0;
    } else {
      _total = value;
    }
  }
  set subtotal(double value) {
    if (value <= 0) {
      _subtotal = 0.0;
    } else {
      _subtotal = value;
    }
  }

  bool isInCart(Product product) {
    return _shoppingList.contains(product);
  }

  void toggleAddToCart(Product product) {
    if (_shoppingList.contains(product)) {
      _shoppingList.remove(product);
      subtotal -= product.price;
      total -= product.price;
    } else {
      _shoppingList.add(product);
      subtotal += product.price;
      total += product.price;
    }
    notifyListeners();
  }
}
