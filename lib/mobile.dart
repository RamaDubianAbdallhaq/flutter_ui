import 'package:flutter/material.dart';
import 'package:respon/homepage.dart';

class mobileBody extends StatelessWidget {
  const mobileBody({super.key});

  @override
  Widget build(BuildContext context) {
    //    final screenWidth = MediaQuery.sizeOf(context).width;
    // final screenHight = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(title: Text("M O B I L E")),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: screenHight * 0.028),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: screenHight * 0.028,
                      ),
                      child: Container(
                        color: Colors.deepPurple[300],
                        height: screenHight * (168 / 1024),

                        // width: screenWidth * (328 / 360),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
