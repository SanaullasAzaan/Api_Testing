import 'package:flutter/material.dart';
import 'exclusive_item.dart';

class ExclusiveContainer extends StatelessWidget {
  const ExclusiveContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final itemWidth = constraints.maxWidth * 0.4; // Define item width
        final itemHeight = itemWidth * 1.5; // Define item height

        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(constraints.maxWidth * 0.04),
          margin: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.04),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue.shade50,
                Colors.blue.shade100,
              ],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row with text and icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Exclusive for You',
                    style: TextStyle(
                      fontSize: constraints.maxWidth * 0.045,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    size: constraints.maxWidth * 0.06,
                    color: Colors.black54,
                  ),
                ],
              ),
              SizedBox(height: constraints.maxWidth * 0.04),
              // Exclusive items in horizontal list
              SizedBox(
                height: itemHeight,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: constraints.maxWidth * 0.04),
                      child: ExclusiveItem(
                        width: itemWidth,
                        height: itemHeight,
                        imagePath: 'assets/images/ex1.png',
                        productName: 'Smart Watch',
                        price: 99.99,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: constraints.maxWidth * 0.04),
                      child: ExclusiveItem(
                        width: itemWidth,
                        height: itemHeight,
                        imagePath: 'assets/images/ex2.png',
                        productName: 'Headphones',
                        price: 149.99,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: constraints.maxWidth * 0.04),
                      child: ExclusiveItem(
                        width: itemWidth,
                        height: itemHeight,
                        imagePath: 'assets/images/ex3.png',
                        productName: 'Smartphone',
                        price: 599.99,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: constraints.maxWidth * 0.04),
                      child: ExclusiveItem(
                        width: itemWidth,
                        height: itemHeight,
                        imagePath: 'assets/images/ex1.png',
                        productName: 'Tablet',
                        price: 299.99,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: constraints.maxWidth * 0.04),
                      child: ExclusiveItem(
                        width: itemWidth,
                        height: itemHeight,
                        imagePath: 'assets/images/ex2.png',
                        productName: 'Smart TV',
                        price: 799.99,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
} 