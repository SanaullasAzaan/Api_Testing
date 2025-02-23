import 'package:flutter/material.dart';

class ForwardFloatingButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ForwardFloatingButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: Colors.red,
      child: const Icon(
        Icons.arrow_forward,
        color: Colors.white,
      ),
    );
  }
} 