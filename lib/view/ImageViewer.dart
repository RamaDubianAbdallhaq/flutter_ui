import 'dart:io';

import 'package:flutter/material.dart';

class ImageViewer extends StatelessWidget {
  final File imageFile;

  ImageViewer({required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          imageFile.path.split('/').last,
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: InteractiveViewer(
          panEnabled: true,
          minScale: 0.5,
          maxScale: 4,
          child: Image.file(imageFile),
        ),
      ),
    );
  }
}
