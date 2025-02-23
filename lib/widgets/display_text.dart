import 'package:flutter/material.dart';

class DisplayText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  const DisplayText({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: style,
        textAlign: textAlign ?? TextAlign.left,
      ),
    );
  }
} 