
import 'package:flutter/material.dart';
import 'package:rasponsive_addaptiv/%D8%A7homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // builder: DevicePreview.appBuilder,
      home: Homepage(),
      theme:ThemeData(primarySwatch:Colors.deepPurple
      
      ),
    );
  }
}
