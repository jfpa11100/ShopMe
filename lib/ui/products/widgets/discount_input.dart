import 'package:flutter/material.dart';

class DiscountInput extends StatelessWidget {
  const DiscountInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(26, 26, 26, 0.95),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: TextStyle(fontSize: 12, color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Enter your discount code',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              fixedSize: Size(50, 10),
              backgroundColor: Colors.transparent,
            ),
            onPressed: () {
              // Apply discount logic here
            },
            child: Text(
              'Apply',
              style: TextStyle(
                fontSize: 10,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
