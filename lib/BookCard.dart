import 'package:book/homePage.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String imagePath;
  const BookCard({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 120,
      // height: 180,
      width: screenWidth * 0.25,
      height: screenHight * 0.25,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
    );
  }
}
