import 'package:flutter/material.dart';

class ChatFloatingButton extends StatelessWidget {
  const ChatFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        // Add your chat functionality here
        print('Chat button pressed');
      },
      backgroundColor: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30), // Adjust this value to change the border radius
      ),
      label: const Row(
        children: [
          Icon(
            Icons.chat,
            color: Colors.white,
          ),
          SizedBox(width: 8),
          Text(
            'Chat',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
} 