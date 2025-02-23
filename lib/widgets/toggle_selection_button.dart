import 'package:flutter/material.dart';

import '../screens/register_screen.dart';

class ToggleSelectionButton extends StatefulWidget {
  final Function(bool) onPhoneSelected;

  const ToggleSelectionButton({
    Key? key,
    required this.onPhoneSelected,
  }) : super(key: key);

  @override
  State<ToggleSelectionButton> createState() => _ToggleSelectionButtonState();
}

class _ToggleSelectionButtonState extends State<ToggleSelectionButton> {
  bool isPhoneSelected = true;

  void _handleEmailSelection(BuildContext context) {
    setState(() {
      isPhoneSelected = false;
    });
    widget.onPhoneSelected(false);
    // Navigate to RegisterScreen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final buttonWidth = constraints.maxWidth * 0.8; // 80% of parent width
        final buttonHeight = buttonWidth * 0.15; // Proportional height

        return Center(
          child: Container(
            width: buttonWidth,
            height: buttonHeight,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(buttonHeight / 2),
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isPhoneSelected = true;
                      });
                      widget.onPhoneSelected(true);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isPhoneSelected ? Colors.red : Colors.grey,
                        borderRadius: BorderRadius.circular(buttonHeight / 2),
                      ),
                      child: Center(
                        child: Text(
                          'Phone',
                          style: TextStyle(
                            color: isPhoneSelected ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: buttonHeight * 0.3,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _handleEmailSelection(context),
                    child: Container(
                      decoration: BoxDecoration(
                        color: !isPhoneSelected ? Colors.red : Colors.grey,
                        borderRadius: BorderRadius.circular(buttonHeight / 2),
                      ),
                      child: Center(
                        child: Text(
                          'Email',
                          style: TextStyle(
                            color: !isPhoneSelected ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: buttonHeight * 0.3,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
} 