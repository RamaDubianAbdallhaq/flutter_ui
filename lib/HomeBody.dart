import 'package:book/BookCard.dart';
import 'package:book/homePage.dart';
import 'package:flutter/material.dart';

List<String> books = [
  'assets/images/book1.png',
  'assets/images/book2.png',
  'assets/images/book3.png',
  'assets/images/book4.png',
  'assets/images/book1.png',
  'assets/images/book2.png',
  'assets/images/book3.png',
  'assets/images/book4.png',
  'assets/images/book4.png',
];

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'بحث...',
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
              ),
            ),
          ),

          // SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: (books.length / 2).ceil(),
              itemBuilder: (context, index) {
                int firstBookIndex = index * 2;
                int secondBookIndex = firstBookIndex + 1;
                return SizedBox(
                  height: screenHight * (350 / 844),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      // رف
                      Positioned(
                        bottom: 0,
                        height: screenHight * 0.23,
                        child: Image.asset(
                          'assets/images/shelf.png',
                          width: screenWidth,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      // الكتب
                      Positioned(
                        bottom: screenHight * 0.09,
                        //  screenHight * (8 / 87), // ارتفاع الكتب عن الرف
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BookCard(imagePath: books[firstBookIndex]),
                            if (secondBookIndex < books.length)
                              BookCard(imagePath: books[secondBookIndex]),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
