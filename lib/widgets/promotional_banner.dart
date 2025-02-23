import 'package:flutter/material.dart';
import 'custom_text.dart';
import 'color_custom_text.dart';
import 'apply_button.dart';

class PromotionalBanner extends StatelessWidget {
  final String title;
  final String description;
  final String value;
  final String unit;
  final String imagePath;
  final VoidCallback onApply;

  const PromotionalBanner({
    Key? key,
    required this.title,
    required this.description,
    required this.value,
    required this.unit,
    required this.imagePath,
    required this.onApply,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.blue.shade800,
            Colors.blue.shade500,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            children: [
              // Left side content
              Expanded(
                flex: 3,
                child: SizedBox(
                  height: constraints.maxHeight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: title,
                        description: description,
                        titleSize: 18,
                        descriptionSize: 12,
                      ),
                      ColorCustomText(
                        value: value,
                        unit: unit,
                        fontSize: 14,
                      ),
                      ApplyButton(
                        text: 'Apply Now',
                        onPressed: onApply,
                        width: 90,
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
              // Right side image
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: constraints.maxHeight,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
} 