import 'package:flutter/material.dart';
import 'custom_text.dart';

class KycDetail extends StatelessWidget {
  const KycDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define the specific color using RGBA values
    final Color customColor = Color.fromRGBO(94, 102, 213, 1.0);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.purple.shade50,
              Colors.purple.shade100,
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
          children: [
            const CustomText(
              title: 'Complete Your KYC',
              description: 'Get verified and unlock all features',
              titleSize: 20,
              descriptionSize: 14,
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                // Add your click handler here
                print('KYC Click here tapped');
              },
              child: Text(
                'Click here',
                style: TextStyle(
                  color: customColor, // Using the custom RGB color
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 