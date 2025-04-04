import 'package:flutter/material.dart';

class QuantitySelector extends StatefulWidget {
  final int initialQuantity;

  const QuantitySelector({super.key, this.initialQuantity = 1});

  @override
  // ignore: library_private_types_in_public_api
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.initialQuantity;
  }

  void _increment() {
    setState(() {
      quantity++;
    });
  }

  void _decrement() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 23,
      width: 117,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            highlightColor: Colors.white,
            constraints: BoxConstraints(maxWidth: 100, maxHeight: 40),
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.remove, color: Colors.black, size: 14),
            onPressed: _decrement,
          ),
          Text(
            '$quantity',
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          IconButton(
            highlightColor: Colors.white,
            constraints: BoxConstraints(maxWidth: 100, maxHeight: 40),
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.add, color: Colors.black, size: 14),
            onPressed: _increment,
          ),
        ],
      ),
    );
  }
}
