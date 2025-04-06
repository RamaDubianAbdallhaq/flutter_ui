import 'dart:io';

import 'package:flutter/material.dart';

class OnBoardingThreePage extends StatelessWidget {
  OnBoardingThreePage({super.key});
  final File file = File(
    "C:/Users/Rama/Desktop/dart flutter/ui_flutter/cuate2.png",
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
            SizedBox(
              width: 20,
              height: 33,
            ),
          
        
            Container(width: 260, height: 219, child: Image.file(file)),
        
            Text(
              "Check Progress",
        
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
            ),
            Container(
              height: 87,
              width: 279,
              child: Text(
                "See how much you have done from your tasks",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(153, 153, 153, 1),
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
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(139, 168, 181, 1),
        
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
