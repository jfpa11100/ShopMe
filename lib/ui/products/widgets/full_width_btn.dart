import 'package:flutter/material.dart';

class FullWidthBtn extends StatelessWidget {
  final String text;
  final VoidCallback onPressedAction;

  const FullWidthBtn({
    super.key,
    required this.text,
    required this.onPressedAction,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(214, 243, 162, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: onPressedAction,
          child: Text(
            text,
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
