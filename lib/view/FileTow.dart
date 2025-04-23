import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:path_provider_file/view/CloudStorageScreen.dart';
import 'package:path_provider_file/view/FileManagerScreen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _page = 0;
  final List<Widget> _pages = [
    FileManagerScreen(),
    CloudStorageScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_page],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Color(0xFF8E2DE2),
        buttonBackgroundColor: Color(0xFFFFA500),
        height: 75,
        items: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.home, size: 30, color: Colors.white),
              if (_page == 0)
                Text(
                  "home",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.folder, size: 30, color: Colors.white),
              if (_page == 1)
                Text(
                  "folder",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.cloud, size: 30, color: Colors.white),
              if (_page == 2)
                Text(
                  "cloud",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
            ],
          ),
        ],
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SettingsScreen")),
      body: Center(child: Text(" Setting")),
    );
  }
}
