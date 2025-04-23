// // file_manager_service.dart
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:flutter/material.dart';

// class FileManagerService {
//   // دالة لتحميل المجلد
//   Future<void> loadDirectory(
//     Directory dir,
//     Function(List<FileSystemEntity> items) onSuccess,
//     Function(String error) onError,
//   ) async {
//     try {
//       final children = await dir.list().toList();
//       children.sort((a, b) {
//         if (a is Directory && b is File) return -1;
//         if (a is File && b is Directory) return 1;
//         return a.path.compareTo(b.path);
//       });
//       onSuccess(children);  // استدعاء الدالة عندما يتم تحميل المجلدات بنجاح
//     } catch (e) {
//       onError('خطأ في الوصول للمجلد: ${e.toString()}');  // استدعاء الدالة عندما يحدث خطأ
//     }
//   }

//   // دالة للتحقق إذا كان الملف صورة
//   bool isImageFile(String path) {
//     final ext = path.toLowerCase();
//     return ext.endsWith(".jpg") ||
//         ext.endsWith(".jpeg") ||
//         ext.endsWith(".png") ||
//         ext.endsWith(".gif") ||
//         ext.endsWith(".webp");
//   }

//   // دالة لحساب حجم الملف
//   Future<int> getFileSize(File file) async {
//     try {
//       return (await file.stat()).size;
//     } catch (e) {
//       return 0;
//     }
//   }

//   // دالة لحساب معلومات المجلد (عدد العناصر والحجم الكلي)
//   Future<Map<String, dynamic>> getFolderInfo(Directory dir) async {
//     int count = 0;
//     int totalSize = 0;

//     try {
//       await for (var entity in dir.list(recursive: true)) {
//         count++;
//         if (entity is File) {
//           totalSize += (await entity.stat()).size;
//         }
//       }
//     } catch (e) {
//       print("Error calculating folder size: $e");
//     }

//     return {'count': count, 'size': formatSize(totalSize)};
//   }

//   // دالة تنسيق الحجم
//   String formatSize(int bytes) {
//     if (bytes < 1024) {
//       return '$bytes bytes';
//     } else if (bytes < 1048576) {
//       return '${(bytes / 1024).toStringAsFixed(2)} KB';
//     } else if (bytes < 1073741824) {
//       return '${(bytes / 1048576).toStringAsFixed(2)} MB';
//     } else {
//       return '${(bytes / 1073741824).toStringAsFixed(2)} GB';
//     }
//   }
// }
