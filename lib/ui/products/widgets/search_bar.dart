import 'package:flutter/material.dart';

class SearchBarProducts extends StatelessWidget {
  const SearchBarProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search products',
                border: InputBorder.none,
              ),
            ),
          ),
          const Icon(Icons.search, color: Colors.grey),
        ],
      ),
    );
  }
}
