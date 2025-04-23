
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider_file/view/card.dart';
import 'package:path_provider_file/view/formatColor.dart';
import 'package:permission_handler/permission_handler.dart';

class CloudStorageScreen extends StatefulWidget {
  @override
  _CloudStorageScreenState createState() => _CloudStorageScreenState();
}

class _CloudStorageScreenState extends State<CloudStorageScreen> {
  String _searchQuery = '';
  Directory? currentDir;
  List<FileSystemEntity> items = [];
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

  
  List<FileSystemEntity> get _filteredFolders {
    if (_searchQuery.isEmpty) {
      return items;
    }
    return items
        .where(
          (folder) => folder.path
              .split('/')
              .last
              .toLowerCase()
              .contains(_searchQuery.toLowerCase()),
        )
        .toList();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cloud 🌟'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: FolderSearchDelegate(items),
              );
            },
          ),
        ],
      ),
      body:
          isLoading
              ? Center(child: CircularProgressIndicator())
              : Column(
                children: [
                  CloudCard(),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Folders from Desktop',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Search folders...',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _searchQuery = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child:
                        _filteredFolders.isEmpty
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
                                    'لا توجد مجلدات',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            )
                            : GridView.builder(
                              padding: EdgeInsets.all(16),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, // عدد العناصر بكل صف
                                    mainAxisSpacing: 5,
                                    crossAxisSpacing: 2,
                                    childAspectRatio:
                                        3, // لتحديد عرض-إلى-ارتفاع البطاقة
                                  ),
                              itemCount: _filteredFolders.length,
                              itemBuilder: (context, index) {
                                final folder =
                                    _filteredFolders[index] as Directory;
                                return SizedBox(
                                  width: 300,
                                  height: 60,
                                  child: Card(
                                    child: ListTile(
                                      leading: Icon(
                                        Icons.folder,
                                        color: Colors.amber,
                                      ),
                                      title: Text(
                                        folder.parent.path.split('/').last,
                                      ),
                                      // title: Text(folder.path.split('/').last),
                                      subtitle: FutureBuilder<
                                        Map<String, dynamic>
                                      >(
                                        future: getFolderInfo(folder),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            return Text(
                                              "${snapshot.data!['count']}",
                                              //  items | ${snapshot.data!['size']}",
                                            );
                                          }
                                          return Text("Loading...");
                                        },
                                      ),
                                      onTap: () {
                                        // التنقل إلى المجلد
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                  ),
                ],
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (currentDir != null) {
            final newDir = Directory('${currentDir!.path}/New Folder');
            await newDir.create();
            loadDirectory(currentDir!);
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('تم إنشاء مجلد جديد')));
          }
        },
        child: Icon(Icons.create_new_folder),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class FolderSearchDelegate extends SearchDelegate<String> {
  final List<FileSystemEntity> folders;

  FolderSearchDelegate(this.folders);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final filtered =
        folders
            .where(
              (folder) => folder.path
                  .split('/')
                  .last
                  .toLowerCase()
                  .contains(query.toLowerCase()),
            )
            .toList();

    return ListView.builder(
      itemCount: filtered.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filtered[index].path.split('/').last),
          onTap: () {
            close(context, filtered[index].path);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filtered =
        folders
            .where(
              (folder) => folder.path
                  .split('/')
                  .last
                  .toLowerCase()
                  .contains(query.toLowerCase()),
            )
            .toList();

    return ListView.builder(
      itemCount: filtered.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filtered[index].path.split('/').last),
          onTap: () {
            close(context, filtered[index].path);
          },
        );
      },
    );
  }
}
