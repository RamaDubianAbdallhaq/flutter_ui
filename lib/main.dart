import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_file/view/CloudStorageScreen.dart';
import 'package:path_provider_file/view/FileManagerScreen.dart';
import 'package:path_provider_file/view/FileTow.dart';
import 'package:path_provider_file/view/OnboardingScreen.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: OnboardingScreen(),
      // home: FileManagerScreen2()),
      // home: FileManagerScreen3(),
        home: MainScreen(),
      // home: CloudStorageScreen(),
    ),
  );
}
