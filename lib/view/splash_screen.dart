import 'package:bottom_navigation_bar/view/home_page.dart';
import 'package:bottom_navigation_bar/view/search.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => search()),
        );
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 50, 39, 86),
      body: Center(child: Image.asset("assets/images/mic.png")),
    );
  }
}
