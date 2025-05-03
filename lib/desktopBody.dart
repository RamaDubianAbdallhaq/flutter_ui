import 'package:flutter/material.dart';

class MydesktopBody extends StatelessWidget {
  const MydesktopBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(title: Text("D E S K T O P")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Container(height: 200, color: Colors.deepPurple),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              color: Colors.deepPurple[300],
                              height: 120,
                            ),
                          );
                        },
                      ),
                    ),
                    Container(width: 200, color: Colors.deepPurple[300]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
