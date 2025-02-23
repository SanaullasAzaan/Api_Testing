import 'package:flutter/material.dart';

class ColorCustomText extends StatelessWidget {
  final String value;
  final String unit;
  final double? fontSize;

  const ColorCustomText({
    Key? key,
    required this.value,
    required this.unit,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: value,
            style: TextStyle(
              fontSize: fontSize ?? 20,
              fontWeight: FontWeight.bold,
              color: Colors.lightBlue,
            ),
          ),
          TextSpan(
            text: ' $unit',
            style: TextStyle(
              fontSize: fontSize ?? 20,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
} 