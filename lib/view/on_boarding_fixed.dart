import 'dart:io';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingFixed extends StatelessWidget {
  OnBoardingFixed({super.key});
  final PageController controller = PageController();
  final File file = File(
    "C:/Users/Rama/Desktop/dart flutter/ui_flutter/cuate.png",
  );
  final File file1 = File(
    "C:/Users/Rama/Desktop/dart flutter/ui_flutter/cuate1.png",
  );
  final File file2 = File(
    "C:/Users/Rama/Desktop/dart flutter/ui_flutter/cuate2.png",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 500,
            width: 360,
            child: PageView(
              controller: controller,
              children: [
                Column(
                  spacing: 33,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 16, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Skip",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(width: 260, height: 219, child: Image.file(file)),

                    Text(
                      "Write Lists",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 87,
                      width: 279,
                      child: Text(
                        "Write your tasks in a list and check them when done!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ],
                ),

                Column(
                  spacing: 33,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 16, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Skip",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                              color: Color.fromRGBO(139, 168, 181, 1.0),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: 260,
                      height: 219,
                      child: Image.file(file1),
                    ),

                    Text(
                      "Stay Organized",

                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                    Container(
                      height: 87,
                      width: 279,
                      child: Text(
                        "Group your tasks and keep them organized",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(153, 153, 153, 1),
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  spacing: 33,
                  children: [
                    SizedBox(width: 20, height: 33),

                    Container(width: 260, height: 219, child: Image.file(file)),

                    Text(
                      "Check Progress",

                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                    Container(
                      height: 87,
                      width: 279,
                      child: Text(
                        "See how much you have done from your tasks",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(153, 153, 153, 1),
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SmoothPageIndicator(
            controller: controller, // PageController
            count: 3,
            effect: SwapEffect(
              dotHeight: 10,
              dotWidth: 10,
              dotColor: Color.fromRGBO(217, 217, 217, 1), // لون النقاط العادية
              activeDotColor: Color.fromRGBO(
                139,
                168,
                181,
                1,
              ), // لون النقطة النشطة
            ),
            onDotClicked: (index) {
              controller.animateToPage(
                index,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
          ),

          InkWell(
            onTap: () {
              controller.nextPage(
                duration: Duration(seconds: 2),
                curve: Curves.ease,
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromRGBO(139, 168, 181, 1),
              ),
              width: 317,
              height: 54,
              child: Center(
                child: Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
