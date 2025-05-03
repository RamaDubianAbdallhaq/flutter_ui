import 'package:flutter/material.dart';
import 'package:respon/gridView.dart';
import 'package:respon/homepage.dart';

class ipadBody extends StatelessWidget {
  const ipadBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(title: Text("i p a d ")),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: screenHight * 0.028),
        child: Column(
          children: [
            Expanded(
              child: gridVieww(),
            ),
            Container(width: 200, color: Colors.deepPurple[300]),
          ],
        ),
      ),
    );
  }
}
