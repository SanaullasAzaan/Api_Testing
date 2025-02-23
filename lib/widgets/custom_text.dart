import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String title;
  final String description;
  final double? titleSize;
  final double? descriptionSize;

  const CustomText({
    Key? key,
    required this.title,
    required this.description,
    this.titleSize,
    this.descriptionSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: titleSize ?? 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: TextStyle(
            fontSize: descriptionSize ?? 16,
            color: Colors.black.withOpacity(0.9),
          ),
        ),
      ],
    );
  }
} 