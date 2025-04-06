// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:ui_flutter/view/home_page.dart';
// import 'package:ui_flutter/view/on_boarding.dart';
// import 'package:ui_flutter/view/on_boarding_three.dart';
// import 'package:ui_flutter/view/on_boarding_two.dart';

// void main() {
//   runApp(const MyApp());
// }

// // TODO : 1-Closure 2-Icon 3-Image.
// // TODO : 4-Practice in OnBoarding 5-ViewPadding 6-Controller
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: PageView(
//         scrollDirection: Axis.horizontal,
//         physics: BouncingScrollPhysics(),
//         children: [OnBoardingPage(), OnBoardingTowPage(),OnBoardingThreePage()],
//       ),
//     );
//   }
// }

/*
import 'package:flutter/material.dart';
import 'package:ui_flutter/view/CustomNavigationBar.dart';
import 'package:ui_flutter/view/home_page.dart';
import 'package:ui_flutter/view/on_boarding_fixed.dart';
import 'package:ui_flutter/view/psiphon_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //  home: OnBoardingFixed(),
      //  home:  HomePageFromData(controller: controller,),
      //  home:  HomePageBridge(controller: controller,),
        home: PsiphonPage(),
      //  home:FoodPage(),
      // home: RemoteDataPage(),
    );
  }
}

class HomePageBridge extends StatelessWidget {
  const HomePageBridge({super.key, required this.controller});

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: BouncingScrollPhysics(),
      controller: controller,
      children: [
        HomePage(
          onTT: () {
            controller.animateTo(
              10000,
              duration: Duration(seconds: 3),
              curve: Curves.ease,
            );
          },
        ),
        HomePage(
          onTT: () {
            controller.nextPage(
              duration: Duration(seconds: 2),
              curve: Curves.easeOutBack,
            );
          },
        ),
        HomePage(
          onTT: () {
            print(controller.offset);
            controller.nextPage(
              duration: Duration(seconds: 2),
              curve: Curves.easeOutBack,
            );
          },
        ),
        HomePageFromData(controller: controller),
      ],
    );
  }
}

class HomePageFromData extends StatelessWidget {
  HomePageFromData({super.key, required this.controller});
  List<String> namesForReal = [
    "Ahmad",
    "Noor",
    "Yaser",
    "Ahmad",
    "Noor",
    "Yaser"
        "Ahmad",
    "Noor",
    "Yaser"
        "Ahmad",
    "Noor",
    "Yaser"
        "Ahmad",
    "Noor",
    "Yaser"
        "Ahmad",
    "Noor",
    "Yaser",
    "Ahmad",
    "Noor",
    "Yaser",
  ];

  final PageController controller;
  Widget _buildAdsCompent() {
    return FlutterLogo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 600,
              child: ListView.builder(
                // separatorBuilder:
                //     (context, index) => Divider(indent: 20, endIndent: 20),
                itemCount: namesForReal.length,
                itemBuilder:
                    (context, index) => ListTile(
                      leading: CircleAvatar(
                        child: Text((index + 1).toString()),
                      ),
                      // selectedColor: Colors.red,
                      // enabled: false,
                      onTap: () {},
                      mouseCursor: SystemMouseCursors.click,
                      hoverColor: Colors.blue,
                      splashColor: Colors.yellow,
                      titleTextStyle: TextStyle(color: Colors.orange),

                      // selected: true,
                      title: Text(
                        namesForReal[index],
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
              ),
            ),

            CutsomButton(title: "Next", method: () {}),

            //   FloatingActionButton(onPressed:  () {
            //   controller.nextPage(
            //     duration: Duration(seconds: 2),
            //     curve: Curves.easeOutBack,
            //   );
            // },

            // )
          ],
        ),
        // child: ListView(
        // children: List.generate(
        //   namesForReal.length,
        //   (index) => ListTile(
        //     title: Text(namesForReal[index]),
        //     leading: CircleAvatar(child: Text(index.toString())),
        //   ),
        // ),
        // ),
      ),
    );
  }
}

class CutsomButton extends StatelessWidget {
  CutsomButton({super.key, required this.title, required this.method});
  String title;
  Function method;
  // ! YAGNI: You Aren't gonna need it
  // double padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: InkWell(
        onTap: method(),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue.shade300,
          ),
          width: 317,
          height: 54,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';

import 'package:ui_flutter/model/quiz_model.dart';
import 'package:ui_flutter/view/quize_app.dart';
import 'package:ui_flutter/view/quizze_app.dart';
import 'package:ui_flutter/view/remote_data_page.dart';
import 'package:ui_flutter/view/showModalBottomSheet.dart';

void main() {
  runApp(MyApp());
}

int coutner = 0;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: RemoteDataPage(),
      // home: RemoteData(),
      //  home:RemoteDataa(),
      //  home: AddQuizPage(),

      // home: HomePage()
    );
  }
}

/*
class SplahScreen extends StatelessWidget {
  const SplahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(coutner.toString())),
      body: Container(
        foregroundDecoration: BoxDecoration(
          // color: Colors.yellow.shade100,
          // backgroundBlendMode: BlendMode.softLight,
          // border: Border.all(color: Colors.black, strokeAlign: 10),
          // borderRadius: BorderRadius.circular(20),
        ),
        child: Center(child: Image.asset("assets/images/frame.png")),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back_frame.png'),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,

            end: Alignment.bottomCenter,
            colors: [Color(0xFFFAD293), Color(0xFFCD7A3C)],
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          // Navigator.pop(context);
          coutner++;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
        child: FlutterLogo(),
      ),
    );
  }
}
*/
// class HomePage extends StatelessWidget {
//   HomePage._();

//   static HomePage home = HomePage._();

//   static getInstance() {
//     return home;
//   }

//   QuizModel quiz = QuizModel(
//     question: "How Old Are You ?",
//     answers: ["20", "30", "100", "40"],
//     indexOfCorrectAnswer: 0,
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(coutner.toString())),

//       // TODO : Make it with multiQuistion
//       // body: PageView.builder(
//       //   itemCount: ,
//       //   itemBuilder:(context, index) => , ),
//       body: Center(
//         child: Column(
//           children: [
//             ListTile(title: Text(quiz.question)),
//             SizedBox(
//               height: 400,
//               child: GridView.builder(
//                 scrollDirection: Axis.vertical,
//                 itemCount: quiz.answers.length,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   // maxCrossAxisExtent: 200,
//                   mainAxisSpacing: 8,
//                   crossAxisSpacing: 8,
//                 ),
//                 itemBuilder:
//                     (context, inx) => InkWell(
//                       onTap: () {
//                         if (inx == quiz.indexOfCorrectAnswer) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Text("YEEEEEEEEEEEEEEEEE"),
//                               behavior: SnackBarBehavior.floating,
//                               backgroundColor: Colors.green,
//                             ),
//                           );
//                           // TODO : Add Controller for PageView
//                         } else {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Text("Nooooooooooooooo"),
//                               backgroundColor: Colors.red,
//                             ),
//                           );
//                         }
//                       },
//                       child: Center(child: Text(quiz.answers[inx])),
//                     ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

/*
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentQuestionIndex = ValueNotifier(0);

  final List<QuizModel> quizList = [
    QuizModel(
      questionText: "How old are you?",
      options: [
        Options(answerText: "20", isCorrect: true),
        Options(answerText: "30", isCorrect: false),
        Options(answerText: "100", isCorrect: false),
        Options(answerText: "40", isCorrect: false),
      ],
    ),
    QuizModel(
      questionText: "What is your name?",
      options: [
        Options(answerText: "haneen", isCorrect: false),
        Options(answerText: "hala", isCorrect: false),
        Options(answerText: "rama", isCorrect: true),
        Options(answerText: "lana", isCorrect: false),
      ],
    ),
    QuizModel(
      questionText: "What's your specialty?",
      options: [
        Options(answerText: "doctor", isCorrect: false),
        Options(answerText: "engineer", isCorrect: true),
        Options(answerText: "teacher", isCorrect: false),
        Options(answerText: "dentist", isCorrect: false),
      ],
    ),
    QuizModel(
      questionText: "What is the capital of France?",
      options: [
        Options(answerText: "Berlin", isCorrect: false),
        Options(answerText: "Madrid", isCorrect: false),
        Options(answerText: "Paris", isCorrect: true),
        Options(answerText: "Rome", isCorrect: false),
      ],
    ),
  ];

  void _checkAnswer(BuildContext context, bool isCorrect) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 200,

        content: Text(isCorrect ? "Correct!" : "Wrong!"),
        backgroundColor: isCorrect ? Colors.green : Colors.red,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
        // margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );

    Future.delayed(Duration(seconds: 1), () {
      //  للتحق انه اخر سؤال وذا صح ينتقل ل صفحة تالية

      if (_currentQuestionIndex.value < quizList.length - 1) {
        if (isCorrect = isCorrect) {
          _currentQuestionIndex.value++;
          _pageController.nextPage(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        } else {}
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Quiz Completed!"),
            backgroundColor: Colors.blue,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz App")),
      body: Column(
        children: [
          SizedBox(
            // width: 600,
            height: 600,

            child: ValueListenableBuilder<int>(
              valueListenable: _currentQuestionIndex,
              builder: (context, index, child) {
                final quiz = quizList[index];
                return PageView.builder(
                  controller: _pageController,
                  // لمنع المستخدم من تمرير بين صفحات
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: quizList.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            quiz.questionText,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity / 2,
                            height: 500,
                            child: GridView.builder(
                              // shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 8,
                                  ),
                              itemCount: quiz.options.length,
                              itemBuilder: (context, inx) {
                                return SizedBox(
                                  width: 200,
                                  height: 30,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero,
                                      ),
                                    ),

                                    onPressed: () {
                                      _checkAnswer(
                                        context,
                                        quiz.options[inx].isCorrect,
                                      );
                                    },
                                    child: Text(quiz.options[inx].answerText),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
*/
