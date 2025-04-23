import 'dart:io';
import 'package:flutter/material.dart';

class CreateFolderButton extends StatelessWidget {
  final Directory? currentDir;
  final Function loadDirectory;

  const CreateFolderButton({
    required this.currentDir,
    required this.loadDirectory,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blue.shade700,
      child: Icon(Icons.create_new_folder, color: Colors.white),
      onPressed: () async {
        if (currentDir != null) {
          final newDir = Directory('${currentDir!.path}/مجلد جديد');
          await newDir.create();
          loadDirectory(currentDir!);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('تم إنشاء مجلد جديد'),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        }
      },
    );
  }
}
