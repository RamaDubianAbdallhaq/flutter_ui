import 'package:bottom_navigation_bar/model/news_model.dart';
import 'package:bottom_navigation_bar/service/news_service.dart';
import 'package:bottom_navigation_bar/view/splash_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class search extends StatefulWidget {
  search({super.key});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  List<NewsModel> news = [];
  List<NewsModel> searchResult = [];
  int _page = 0; 
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  
  List<Widget> pages = [
    HomePage2(), 
    SplashScreen(), 
    HomePage2(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Color(0xFF002040),
        buttonBackgroundColor: Color(0xFFFFA500),
        height: 75,
        items: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.home, size: 30, color: Colors.white),
              if (_page == 0)
                Text(
                  "Home",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.bookmark, size: 30, color: Colors.white),
              if (_page == 1)
                Text(
                  "Bookmarks",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.settings, size: 30, color: Colors.white),
              if (_page == 2)
                Text(
                  "Settings",
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
      body: pages[_page], 
    );
  }
}

class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  List<NewsModel> news = [];
  List<NewsModel> searchResult = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), 
              border: Border.all(
                color: Color(0xFFF5F5DC),
                width: 1,
              ), 
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), 
                  blurRadius: 8, 
                  spreadRadius: 2, 
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchResult =
                      news
                          .where(
                            (element) =>
                                element.author != null &&
                                element.author!.startsWith(value),
                          )
                          .toList();
                });
              },
              decoration: InputDecoration(
                labelText: 'Technology Interviews',
                labelStyle: TextStyle(
                  color: const Color.fromARGB(255, 70, 69, 69),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),  
                  borderSide: BorderSide(
                    color: Color(0xFFF5F5DC),
                  ), 
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Color.fromARGB(248, 248, 248, 1),
                  ), 
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Color(0xFFD2B48C),
                    width: 2,
                  ), 
                ),
                filled: true, 
                fillColor: Colors.white,
                
                suffixIcon: Icon(Icons.search, color: Colors.black),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ), 
              ),
              style: TextStyle(
                color: Colors.black,
              ), 
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () async {
           
            news = await NewsService().getNews();
            setState(() {});
          },
          child: Text(""),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Chip(
              side: BorderSide(),
              label: Text('ALL'),

              backgroundColor: const Color.fromARGB(255, 234, 234, 237),
            ),

            // SizedBox(width: 20),
            Chip(label: Text('NEWS'), side: BorderSide()),

            Chip(
              side: BorderSide(),
              label: Text('PHOTO'),

              backgroundColor: const Color.fromARGB(255, 234, 234, 237),
            ),

            Chip(
              side: BorderSide(),
              label: Text('VIDEOS'),

              backgroundColor: const Color.fromARGB(255, 234, 234, 237),
            ),
          ],
        ),

        Expanded(
          child:
              news.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                    scrollDirection: Axis.vertical, 
                    child: Column(
                      children: List.generate(
                        searchResult.isEmpty
                            ? news.length
                            : searchResult.length,
                        (index) {
                          var currentNews =
                              searchResult.isEmpty
                                  ? news[index]
                                  : searchResult[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                            ),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween, 
                              children: [
                                Expanded(
                                  flex: 2, 
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        currentNews.title ?? "No Title",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5), 
                                      Text(currentNews.author ?? "No Author"),
                                      SizedBox(height: 5),
                                      Text(
                                        currentNews.description ??
                                            "No Description",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10), 
                                Expanded(
                                  flex: 1, // الصورة ستأخذ 1/3 من السطر
                                  // child: CircleAvatar(
                                  //   backgroundImage: NetworkImage(
                                  //     currentNews.urlToImage ?? "",
                                  //   ),
                                  //   onBackgroundImageError:
                                  //       (_, __) => FlutterLogo(),
                                  //   radius: 30, // حجم الصورة
                                  // ),
                                  child: Container(
                                    width: 70, 
                                    height: 70, 
                                    decoration: BoxDecoration(
                                      // image: DecorationImage(
                                      //   image: NetworkImage(
                                      //     currentNews.urlToImage ?? "",
                                      //   ),
                                      //   fit:
                                      //       BoxFit
                                      //           .cover, 
                                      // ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),

          //           : ListView.builder(
          //             itemCount:
          //                 searchResult.isEmpty
          //                     ? news.length
          //                     : searchResult.length,
          //             itemBuilder: (context, index) {
          //               var currentNews =
          //                   searchResult.isEmpty
          //                       ? news[index]
          //                       : searchResult[index];
          //               return ListTile(
          //                 leading: CircleAvatar(
          //                   backgroundImage: NetworkImage(
          //                     currentNews.urlToImage ?? "",
          //                   ),
          //                   onBackgroundImageError: (_, __) => FlutterLogo(),
          //                 ),
          //                 title: Text(currentNews.title ?? "No Title"),
          //                 subtitle: Text(currentNews.author ?? "No Author"),
          //               );
          //             },
          //           ),
        ),
      ],
    );
  }
}
