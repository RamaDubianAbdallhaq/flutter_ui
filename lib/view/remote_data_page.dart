// //  import 'package:dio/dio.dart';

// import 'package:flutter/material.dart';
// import 'package:ui_flutter/model/quiz_model.dart';
// import 'package:ui_flutter/service/remote_source.dart';

// class RemoteDataPage extends StatelessWidget {
//   final RemoteSource service = RemoteSource();
//   final PageController _pageController = PageController();
//   RemoteDataPage({super.key});

//   void _checkAnswer(BuildContext context, bool isCorrect) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         width: 200,

//         content: Text(isCorrect ? "Correct!" : "Wrong!"),
//         backgroundColor: isCorrect ? Colors.green : Colors.red,
//         behavior: SnackBarBehavior.floating,
//         duration: Duration(seconds: 2),
//         // margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Quiz App")),
//       body: FutureBuilder<List<QuizModel>>(
//         future: service.getAll(),
//         builder: (context, dataState) {
//           if (dataState.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (dataState.hasError) {
//             return Center(child: Text("Error fetching data"));
//           } else if (dataState.hasData) {
//             List<QuizModel> questions = dataState.data!;

//             return PageView.builder(
//               physics: NeverScrollableScrollPhysics(),
//               controller: _pageController,
//               itemCount: questions.length,
//               itemBuilder: (context, index) {
//                 QuizModel question = questions[index];

//                 return QuizPage(
//                   question: question,
//                   onAnswered: (bool isCorrect) {
//                     if (isCorrect) {
// //                      _checkAnswer(
// //   context,
// //    question.options[index].isCorrect, // استدعاء القيمة الصحيحة
// // );

//                     }

//                     Future.delayed(Duration(seconds: 1), () {
//                       //  للتحق انه اخر سؤال وذا صح ينتقل ل صفحة تالية
//                       if (index < questions.length - 1) {
//                         // if (isCorrect = isCorrect) {
//                           if (question.options[index].isCorrect) {

//                           index++;
//                           _pageController.nextPage(
//                             duration: Duration(milliseconds: 500),
//                             curve: Curves.easeInOut,

//                           );
//                         } else {}
//                       } else {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text("Quiz Completed!"),
//                             backgroundColor: Colors.blue,
//                           ),
//                         );
//                       }
//                     });
//                   },
//                 );
//               },
//             );
//           } else {
//             return Center(child: Text("No questions available"));
//           }
//         },
//       ),
//     );
//   }
// }

// class QuizPage extends StatelessWidget {
//   final QuizModel question;
//   final Function(bool) onAnswered;

//   QuizPage({required this.question, required this.onAnswered});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             question.questionText,
//             style: TextStyle(fontSize: 24),
//             textAlign: TextAlign.center,
//           ),
//           SizedBox(height: 20),
//           GridView.builder(

//             shrinkWrap: true,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               mainAxisSpacing: 8,
//               crossAxisSpacing: 8,
//             ),
//             itemCount: question.options.length,
//             itemBuilder: (context, ind) {
//              Options option = question.options[ind];
//               return ElevatedButton(
//                 onPressed: () {
//                   onAnswered(option.isCorrect);
//                 },
//                 child: Text(option.answerText),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }


///////////////////////////////////////////////////////////////////////////////////////////  هذا الصح
import 'package:flutter/material.dart';
import 'package:ui_flutter/model/quiz_model.dart';
import 'package:ui_flutter/service/remote_source.dart';

class RemoteDataPage extends StatelessWidget {
  final RemoteSource service = RemoteSource();

  final PageController _pageController = PageController();

  void _checkAnswer(BuildContext context, bool isCorrect, int currentIndex, int totalQuestions) {
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isCorrect ? "Correct" : " Wrong "),
        backgroundColor: isCorrect ? Colors.green : Colors.red,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );

    // الانتقال للسؤال التالي بعد ثوانٍ فقط إذا كانت الإجابة صحيحة
    if (isCorrect) {
      Future.delayed(Duration(milliseconds: 800), () {
        if (currentIndex < totalQuestions - 1) {
          _pageController.nextPage(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        } else {
         
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("🎉 انتهى الاختبار!"),
              backgroundColor: Colors.blue,
            ),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("اختبار الأسئلة")),
      body: FutureBuilder<List<QuizModel>>(
        future: service.getAll(),
        builder: (context, dataState) {
          if (dataState.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (dataState.hasError) {
            return Center(child: Text("حدث خطأ في جلب البيانات"));
          } else if (dataState.hasData) {
            List<QuizModel> questions = dataState.data!;

            return PageView.builder(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              itemCount: questions.length,
              itemBuilder: (context, index) {
                QuizModel question = questions[index];

                return QuizPage(
                  question: question,
                  onAnswered: (bool isCorrect) {
                    _checkAnswer(context, isCorrect, index, questions.length);
                  },
                );
              },
            );
          } else {
            return Center(child: Text("لا توجد أسئلة متاحة"));
          }
        },
      ),
    );
  }
}

class QuizPage extends StatelessWidget {
  final QuizModel question;
  final Function(bool) onAnswered;

  QuizPage({required this.question, required this.onAnswered});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            question.questionText,
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: question.options.length,
            itemBuilder: (context, ind) {
              Options option = question.options[ind];
              return ElevatedButton(
                onPressed: () {
                  onAnswered(option.isCorrect);
                },
                child: Text(option.answerText),
              );
            },
          ),
        ],
      ),
    );
  }
}
//////////////////////////////////////////////////////////////////////////////////////////
/*
import 'package:flutter/material.dart';
import 'package:ui_flutter/model/quiz_model.dart';
import 'package:ui_flutter/service/remote_source.dart';

class RemoteDataPage extends StatelessWidget {
  final RemoteSource service = RemoteSource();
  final PageController _pageController = PageController();

  void _checkAnswer(
    BuildContext context,
    bool isCorrect,
    int currentIndex,
    int totalQuestions,
  ) {
    // عرض SnackBar بلون مختلف حسب صحة الإجابة
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isCorrect ? "✔️Correct" : "❌Wrong"),
        backgroundColor: isCorrect ? Colors.green : Colors.red,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );

    // الانتقال للسؤال التالي بعد ثوانٍ فقط إذا كانت الإجابة صحيحة
    if (isCorrect) {
      Future.delayed(Duration(milliseconds: 800), () {
        if (currentIndex < totalQuestions - 1) {
          _pageController.nextPage(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        } else {
          // إظهار رسالة انتهاء الاختبار
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("🎉 انتهى الاختبار!"),
              backgroundColor: Colors.blue,
            ),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("اختبار الأسئلة")),
      body: FutureBuilder<List<QuizModel>>(
        future: service.getAll(),
        builder: (context, dataState) {
          if (dataState.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (dataState.hasError) {
            return Center(child: Text("حدث خطأ في جلب البيانات"));
          } else if (dataState.hasData) {
            List<QuizModel> questions = dataState.data!;

            return PageView.builder(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              itemCount: questions.length,
              itemBuilder: (context, index) {
                QuizModel question = questions[index];

                return QuizPage(
                  question: question,
                  onAnswered: (bool isCorrect) {
                    _checkAnswer(context, isCorrect, index, questions.length);
                  },
                );
              },
            );
          } else {
            return Center(child: Text("لا توجد أسئلة متاحة"));
          }
        },
      ),
    );
  }
}

class QuizPage extends StatelessWidget {
  final QuizModel question;
  final Function(bool) onAnswered;

  QuizPage({required this.question, required this.onAnswered});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(141, 55, 111, 1), // تعيين لون الخلفية
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // نص السؤال
            Text(
              question.questionText,
              style: TextStyle(fontSize: 24, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // إضافة 5 TextField
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // TextField الأول بطول 205 وعرض 281
                Container(
                  width: 281,
                  height: 205,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'سؤال',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // TextFields الأربعة الأخرى
                ...List.generate(4, (index) {
                  return Container(
                    width: 240,
                    height: 48,
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'إجابة ${index + 1}',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
            SizedBox(height: 20),
            // عرض الخيارات
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: question.options.length,
              itemBuilder: (context, ind) {
                Options option = question.options[ind];
                return ElevatedButton(
                  onPressed: () {
                    onAnswered(option.isCorrect);
                  },
                  child: Text(option.answerText),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
*/