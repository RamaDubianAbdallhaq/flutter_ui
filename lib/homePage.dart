import 'package:book/HomeBody.dart';
import 'package:flutter/material.dart';

late double screenWidth;
late double screenHight;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.sizeOf(context).width;
    screenHight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: const Color(0xFFBCC09F),
      appBar: AppBar(
        backgroundColor: const Color(0xFFBCC09F),
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        title: Text(
          'هنا الشطر الآخر من العالم',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        centerTitle: true,
        actions: [
          CircleAvatar(
            backgroundColor: Colors.brown,
            child: Text('ز', style: TextStyle(color: Colors.white)),
          ),
          SizedBox(width: 8),
        ],
      ),
      body: HomeBody(),
    );
  }
}
