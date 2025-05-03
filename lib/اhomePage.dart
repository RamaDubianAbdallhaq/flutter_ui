import 'package:flutter/material.dart';
import 'package:rasponsive_addaptiv/demensions.dart';
import 'package:rasponsive_addaptiv/desktopBody.dart';
import 'package:rasponsive_addaptiv/mobileBody.dart';
import 'package:rasponsive_addaptiv/responsiv.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: screenWidth < mobileWidth ? Colors.amber : Colors.blue,
      body: responsiv(desktopBody: MydesktopBody(), mobileBody: MymobileBody()),
    );
  }
}
