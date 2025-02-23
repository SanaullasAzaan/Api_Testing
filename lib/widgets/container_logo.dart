import 'package:flutter/material.dart';

class ContainerLogo extends StatelessWidget {
  final String imagePath;
  final double height;

  const ContainerLogo({
    Key? key,
    required this.imagePath,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        imagePath,
        height: height,
        fit: BoxFit.contain,
      ),
    );
  }
} 