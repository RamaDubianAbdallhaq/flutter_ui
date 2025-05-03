import 'package:flutter/material.dart';
import 'package:respon/homepage.dart';

class gridVieww extends StatelessWidget {
  const gridVieww({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 389 / 168,
      ),
      itemCount: 12,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: screenHight * 0.028,
            horizontal: screenWidth * 0.028,
          ),
          child: Container(color: Colors.deepPurple[300]),
        );
      },
    );
  }
}
