import 'package:flutter/material.dart';
import 'package:respon/desktop.dart';
import 'package:respon/ipad.dart';
import 'package:respon/mobile.dart';
import 'package:respon/responsiv.dart';
  late double screenWidth;
  late double screenHight;

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
     screenWidth = MediaQuery.sizeOf(context).width;
     screenHight = MediaQuery.sizeOf(context).height;
    // final componentResponsiv =  screenWidth/
    return Scaffold(
      backgroundColor: screenWidth < 480 ? Colors.amber : Colors.blue,
      body: responsiv(desktopBody: desktopBody(), mobileBody: mobileBody(),ipadBody: ipadBody(),),
    );
  }
}
