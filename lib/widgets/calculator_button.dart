import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;

  CalculatorButton({
    required this.text,
    required this.onPressed,
    this.backgroundColor = const Color(0xFF303136),
    this.textColor = const Color(0xFF05ADF0),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 80,
      child: FloatingActionButton(
        heroTag: text,
        onPressed: onPressed,
        backgroundColor: backgroundColor,
        child: Text(
          text,
          style: TextStyle(fontSize: 30, color: textColor),
        ),
      ),
    );
  }
}