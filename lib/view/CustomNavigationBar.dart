import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';



class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Ordering'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title - "Food"
            Text(
              'Food',
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 10), // Space between the title and the subtitle

            // Subtitle - "Order your favorite food"
            Text(
              'Order your favorite food',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 30), // Space between subtitle and the search field

            // Search Field
            TextField(
              decoration: InputDecoration(
                labelText: 'Search for food',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Stack(
        children: [
          // Bottom Navigation Bar with blue decoration
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.home, color: Colors.white),
                    onPressed: () => _onItemTapped(0),
                  ),
                  IconButton(
                    icon: Icon(Icons.search, color: Colors.white),
                    onPressed: () => _onItemTapped(1),
                  ),
                  SizedBox(width: 60), // Space for the center circle
                  IconButton(
                    icon: Icon(Icons.notifications, color: Colors.white),
                    onPressed: () => _onItemTapped(2),
                  ),
                  IconButton(
                    icon: Icon(Icons.settings, color: Colors.white),
                    onPressed: () => _onItemTapped(3),
                  ),
                ],
              ),
            ),
          ),
          // Circle in the middle with raised effect
          Positioned(
            bottom: 35, // Raise the circle
            left: MediaQuery.of(context).size.width / 2 - 30, // Center the circle
            child: Material(
              color: Colors.transparent,
              elevation: 6, // Add shadow to raise the circle
              shape: CircleBorder(),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: Icon(Icons.add, color: Colors.blue),
                  onPressed: () {
                    // Action for the center circle button
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
