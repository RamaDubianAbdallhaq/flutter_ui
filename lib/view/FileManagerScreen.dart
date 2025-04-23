import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider_file/view/ImageViewer.dart';
import 'package:path_provider_file/view/formatColor.dart';
import 'package:permission_handler/permission_handler.dart';

class FileManagerScreen extends StatefulWidget {
  @override
  _FileManagerScreenState createState() => _FileManagerScreenState();
}

class _FileManagerScreenState extends State<FileManagerScreen> {
  Directory? currentDir;
  List<FileSystemEntity> items = [];
  List<Directory> dirHistory = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    requestPermissionAndLoad();
  }

  Future<void> requestPermissionAndLoad() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      Directory dir = Directory('C:/Users/Rama/Desktop');
      setState(() {
        currentDir = dir;
        isLoading = false;
      });
      loadDirectory(dir);
    } else {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('يجب منح صلاحية التخزين لاستخدام التطبيق')),
      );
    }
  }

  Future<void> loadDirectory(Directory dir) async {
    setState(() {
      isLoading = true;
      currentDir = dir;
      dirHistory.add(dir);
    });

    try {
      final children = await dir.list().toList();
      children.sort((a, b) {
        if (a is Directory && b is File) return -1;
        if (a is File && b is Directory) return 1;
        return a.path.compareTo(b.path);
      });
      setState(() {
        items = children;
      });
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('خطأ في الوصول للمجلد: ${e.toString()}')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void goBack() {
    if (dirHistory.length > 1) {
      dirHistory.removeLast();
      loadDirectory(dirHistory.last);
    }
  }

  bool isImageFile(String path) {
    final ext = path.toLowerCase();
    return ext.endsWith(".jpg") ||
        ext.endsWith(".jpeg") ||
        ext.endsWith(".png") ||
        ext.endsWith(".gif") ||
        ext.endsWith(".webp");
  }

  void openImage(File file) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ImageViewer(imageFile: file)),
    );
  }

  Widget buildFolderTile(Directory folder) {
    return GestureDetector(
      onTap: () => loadDirectory(folder),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(Icons.folder, size: 36, color: Colors.amber[700]),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    folder.path.split('/').last,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  FutureBuilder<Map<String, dynamic>>(
                    future: getFolderInfo(folder),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          "${snapshot.data!['count']} عناصر | ${snapshot.data!['size']}",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                          ),
                        );
                      }
                      return Text(
                        "جاري التحميل...",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> getFolderInfo(Directory dir) async {
    int count = 0;
    int totalSize = 0;

    try {
      await for (var entity in dir.list(recursive: true)) {
        count++;
        if (entity is File) {
          totalSize += (await entity.stat()).size;
        }
      }
    } catch (e) {
      print("Error calculating folder size: $e");
    }

    return {'count': count, 'size': formatSize(totalSize)};
  }

  Widget buildImageTile(File file) {
    return GestureDetector(
      onTap: () => openImage(file),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            FutureBuilder<File>(
              future: Future.value(file),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: FileImage(file),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }
                return Icon(Icons.image, size: 36, color: Colors.green);
              },
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    file.path.split('/').last,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  FutureBuilder<int>(
                    future: getFileSize(file),
                    builder: (context, snapshot) {
                      return Text(
                        snapshot.hasData
                            ? formatSize(snapshot.data!)
                            : "جاري التحميل...",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget buildFileTile(File file) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.insert_drive_file,
            size: 36,
            color: _getFileIconColor(file),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  file.path.split('/').last,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 4),
                FutureBuilder<int>(
                  future: getFileSize(file),
                  builder: (context, snapshot) {
                    return Text(
                      snapshot.hasData
                          ? formatSize(snapshot.data!)
                          : "جاري التحميل...",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }

  Color _getFileIconColor(File file) {
    final ext = file.path.toLowerCase().split('.').last;
    switch (ext) {
      case 'pdf':
        return Colors.red;
      case 'doc':
      case 'docx':
        return Colors.blue;
      case 'xls':
      case 'xlsx':
        return Colors.green;
      case 'ppt':
      case 'pptx':
        return Colors.orange;
      case 'txt':
        return Colors.blueGrey;
      case 'zip':
      case 'rar':
        return Colors.deepPurple;
      default:
        return Colors.grey;
    }
  }

  Future<int> getFileSize(File file) async {
    try {
      return (await file.stat()).size;
    } catch (e) {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Row(
          children: [
            Text(
              "My Folder  ",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10),
            Icon(Icons.handshake, size: 30, color: Colors.yellow),
          ],
        ),
        leading:
            dirHistory.length > 1
                ? IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: goBack,
                )
                : null,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black87),
            onPressed: () {
              // إضافة وظيفة البحث
            },
          ),
          IconButton(
            icon: Icon(Icons.refresh, color: Colors.black87),
            onPressed: () {
              if (currentDir != null) {
                loadDirectory(currentDir!);
              }
            },
          ),
        ],
      ),
      body:
          isLoading
              ? Center(child: CircularProgressIndicator())
              : Column(
                children: [
                  if (currentDir != null)
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.folder, size: 20, color: Colors.amber),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              currentDir!.path,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.grey.shade700),
                            ),
                          ),
                          FutureBuilder<Map<String, dynamic>>(
                            future: getFolderInfo(currentDir!),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  "${snapshot.data!['count']} عناصر | ${snapshot.data!['size']}",
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 12,
                                  ),
                                );
                              }
                              return SizedBox();
                            },
                          ),
                        ],
                      ),
                    ),
                  Expanded(
                    child:
                        items.isEmpty
                            ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.folder_open,
                                    size: 60,
                                    color: Colors.grey.shade400,
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'لا توجد ملفات أو مجلدات',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            )
                            : ListView.builder(
                              itemCount: items.length,
                              itemBuilder: (context, index) {
                                final item = items[index];
                                if (item is Directory) {
                                  return buildFolderTile(item);
                                } else if (item is File &&
                                    isImageFile(item.path)) {
                                  return buildImageTile(item);
                                } else if (item is File) {
                                  return buildFileTile(item);
                                }
                                return Container();
                              },
                            ),
                  ),
                ],
              ),
      floatingActionButton: FloatingActionButton(
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
      ),
    );
  }
}
