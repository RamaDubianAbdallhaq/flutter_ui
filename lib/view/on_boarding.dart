import 'dart:io';

import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({super.key});
  final File file = File(
    "C:/Users/Rama/Desktop/dart flutter/ui_flutter/cuate.png",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 800,
        width: 360,
        child: Column(
          spacing: 33,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Skip",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
   
            Image.file(file),

            Text(
              "Write Lists",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 87,
              width: 279,
              child: Text(
                "Write your tasks in a list and check them when done!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
            Row(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(139, 168, 181, 1),

                    shape: BoxShape.circle,
                  ),
                  width: 10,
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(217, 217, 217, 1),

                    shape: BoxShape.circle,
                  ),
                  width: 10,
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(217, 217, 217, 1),

                    shape: BoxShape.circle,
                  ),
                  width: 10,
                  height: 10,
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20),
                color: Color.fromRGBO(139, 168, 181, 1),
              ),
              width: 317,
              height: 54,
              child: Center(
                child: Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
