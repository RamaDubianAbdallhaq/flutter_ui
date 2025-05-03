
import 'package:flutter/material.dart';
import 'package:respon/homepage.dart';


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
