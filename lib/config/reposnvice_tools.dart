import 'package:flutter/material.dart';

late double screenWidth;
late double screenHeight;

class reposnvice_tools {
  // static void init(BuildContext context) {
  //   final size = MediaQuery.sizeOf(context);
  //   screenWidth = size.width;
  //   screenHeight = size.height;

  // }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.sizeOf(context).width;
    screenHeight = MediaQuery.sizeOf(context).height;
    // final componentResponsiv =  screenWidth/
    return Scaffold(
      backgroundColor: screenWidth < 480 ? Colors.amber : Colors.blue,
    );
  }
}
