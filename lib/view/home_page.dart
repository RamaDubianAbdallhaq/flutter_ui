/*import 'package:bottom_navigation_bar/model/news_model.dart';
import 'package:bottom_navigation_bar/service/news_service.dart';
import 'package:bottom_navigation_bar/view/splash_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  List<NewsModel> news = [];
  List<NewsModel> searchResult = [];
  int currentIndex = 0;
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  List<Widget> pages = [HomePage(), SplashScreen(), HomePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        items: <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
        
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              news.where((element) => element.author != null).forEach((
                element,
              ) {
                if (element.author!.startsWith(value)) {
                  searchResult.add(element);
                }
              });
              news.clear();
              news = searchResult;
              setState(() {});
            },
          ),
          ElevatedButton(
            onPressed: () async {
              news = await NewsService().getNews();
              setState(() {});
            },
            child: Text("get news"),
          ),

          Container(
            height: 500,
            child:
                news.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                      itemCount: news.length,
                      itemBuilder:
                          (context, index) => ListTile(
                            leading: CircleAvatar(
                              child: Image.network(
                                news[index].urlToImage ?? "",
                                errorBuilder: (context, error, stackTrace) {
                                  return FlutterLogo();
                                },
                              ),
                            ),
                            title: Text(news[index].title ?? "Hello"),
                          ),
                    ),
          ),
        ],
      ),
      // Container(
      //   color: Colors.blueAccent,
      //   child: Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: <Widget>[
      //         Text(_page.toString(), style: TextStyle(fontSize: 160)),
      //         ElevatedButton(
      //           child: Text('Go To Page of index 1'),
      //           onPressed: () {
      //             final CurvedNavigationBarState? navBarState =
      //                 _bottomNavigationKey.currentState;
      //             navBarState?.setPage(1);
      //           },
      //         )
      //       ],
      //     ),
      //   ),
      // )
    );
    // (
    //   body: pages[currentIndex],
    //   bottomNavigationBar: NavigationBar(

    //     // shadowColor: Colors.black,
    //     // elevation: 0,
    //     // surfaceTintColor: Colors.white,
    //     // animationDuration: Duration(seconds: 4),
    //     // backgroundColor: Colors.red,
    //     // indicatorColor: Colors.green,
    //     labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
    //     onDestinationSelected: (value) {
    //       setState(() {
    //         currentIndex = value;
    //       });
    //     },
    //     selectedIndex: currentIndex,
    //     destinations: [
    //       NavigationDestination(
    //         // enabled: false,
    //         selectedIcon: Icon(Icons.facebook),
    //         tooltip: 'This is home',
    //         icon: Icon(Icons.home),
    //         label: 'Home',
    //       ),

    //       NavigationDestination(icon: Icon(Icons.mail), label: 'Mail'),
    //       NavigationDestination(icon: Icon(Icons.maps_home_work), label: 'Map'),
    //     ],
    //   ),
    // );
  }
}
*/
