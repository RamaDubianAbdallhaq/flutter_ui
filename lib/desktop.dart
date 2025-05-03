import 'package:flutter/material.dart';
import 'package:respon/gridView.dart';
import 'package:respon/homepage.dart';

class desktopBody extends StatelessWidget {
  const desktopBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(title: Text("D E S K T O P")),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: screenHight * 0.028),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: screenHight * 0.028,
                    ),
                    child: Container(
                      width: screenWidth * (682 / 1440),
                      height: screenHight * (368 / 1024),

                      color: Colors.deepPurple[300],
                    ),
                  ),
                  Expanded(child: gridVieww()),
                  Container(width: 200, color: Colors.deepPurple[300]),
                ],
              ),
            ),

            Expanded(
              child: Column(
                children: [
                  Expanded(child: gridVieww()),
                  // Container(width: 200, color: Colors.deepPurple[300]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
