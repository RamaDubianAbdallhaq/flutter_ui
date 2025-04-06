import 'package:flutter/material.dart';
import 'package:ui_flutter/model/quiz_model.dart';


class AddQuizPage extends StatelessWidget {
  AddQuizPage({super.key});

  final TextEditingController question = TextEditingController();
  final TextEditingController answer1 = TextEditingController();
  final TextEditingController answer2 = TextEditingController();
  final TextEditingController answer3 = TextEditingController();
  final TextEditingController answer4 = TextEditingController();
  final TextEditingController indexOfCorrect = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(141, 55, 111, 1), // لون الخلفية
      body: Center(
        child: Container(
          width: 360, // العرض المطلوب
          height: 717, // الطول المطلوب
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // حقل السؤال (أطول من الخيارات)
              SizedBox(
                width: 281,
                height: 205,
                child: TextField(
                  controller: question,
                  maxLines: 6,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'أدخل السؤال هنا',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15), // مسافة بين الحقول

              // الحقول الأربعة الخاصة بالخيارات
              for (var controller in [answer1, answer2, answer3, answer4])
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: SizedBox(
                    width: 240,
                    height: 48,
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: 'أدخل الإجابة',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),

              SizedBox(height: 15), // مسافة قبل المؤشر الصحيح

              // إدخال رقم الإجابة الصحيحة
              SizedBox(
                width: 120,
                height: 48,
                child: TextField(
                  controller: indexOfCorrect,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'رقم الإجابة الصحيحة',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20), // مسافة قبل الزر

              // زر الحفظ
              InkWell(
                onTap: () {
                  List<Options> options = [
                    Options(answerText: answer1.text, isCorrect: false),
                    Options(answerText: answer2.text, isCorrect: false),
                    Options(answerText: answer3.text, isCorrect: false),
                    Options(answerText: answer4.text, isCorrect: false),
                  ];

                  int correctIndex = int.tryParse(indexOfCorrect.text) ?? -1;
                  if (correctIndex >= 0 && correctIndex < 4) {
                    options[correctIndex].isCorrect = true;
                  }

                  QuizModel quiz = QuizModel(
                    questionText: question.text,
                    options: options,
                  );

                  // QuizService().createNewQuiz(quiz);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("تم حفظ السؤال بنجاح!"),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                child: Container(
                  width: 300,
                  height: 54,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'إضافة السؤال',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:ui_flutter/model/quiz_model.dart';
// import 'package:ui_flutter/service/remote_source.dart';

// class AddQuizPage extends StatelessWidget {
//  AddQuizPage({super.key});
//   final RemoteSource service = RemoteSource();
//   TextEditingController question = TextEditingController();
//    TextEditingController answer1 = TextEditingController();
//   TextEditingController answer2 = TextEditingController();
//   TextEditingController answer3 = TextEditingController();
//   TextEditingController answer4 = TextEditingController();
//   TextEditingController indexOfCorrect = TextEditingController();

//    final PageController _pageController = PageController();
//   @override
  
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("اختبار المعرفة")),
//       body: FutureBuilder<List<QuizModel>>(
//         future:service. getAll(), // استخدام دالة getAll لجلب البيانات
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }

//           if (snapshot.hasError) {
//             return Center(child: Text("حدث خطأ في جلب البيانات"));
//           }

//           if (snapshot.hasData) {
//             List<QuizModel> quizzes = snapshot.data!;
//             return PageView.builder(
//               controller: _pageController,
//               itemCount: quizzes.length,
//               itemBuilder: (context, index) {
//                 return QuizQuestionPage(
//                   quizModel: quizzes[index],
//                   onAnswered: (isCorrect) {
//                     // إذا كانت الإجابة صحيحة، انتقل إلى السؤال التالي
//                     if (isCorrect) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text("إجابة صحيحة!")),
//                       );
//                       // الانتقال إلى السؤال التالي
//                       Future.delayed(Duration(seconds: 1), () {
//                         if (index < quizzes.length - 1) {
//                           _pageController.nextPage(
//                             duration: Duration(milliseconds: 300),
//                             curve: Curves.easeIn,
//                           );
//                         }
//                       });
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text("إجابة خاطئة!")),
//                       );
//                     }
//                   },
//                 );
//               },
//             );
//           }

//           return Center(child: Text("لا توجد أسئلة"));
//         },
//       ),
//     );
//   }
// }

// class QuizQuestionPage extends StatefulWidget {
//   final QuizModel quizModel;
//   final Function(bool) onAnswered;

//   const QuizQuestionPage({
//     super.key,
//     required this.quizModel,
//     required this.onAnswered,
//   });

//   @override
//   _QuizQuestionPageState createState() => _QuizQuestionPageState();
// }

// class _QuizQuestionPageState extends State<QuizQuestionPage> {
//   int? selectedAnswerIndex;

//   void _handleAnswer(int index) {
//     setState(() {
//       selectedAnswerIndex = index;
//     });

//     bool isCorrect = widget.quizModel.options[index].isCorrect;
//     widget.onAnswered(isCorrect);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Text(
//             widget.quizModel.questionText,
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             textAlign: TextAlign.center,
//           ),
//         ),
//         TextField(
//           decoration: InputDecoration(labelText: "أدخل إجابتك هنا"),
//           onChanged: (value) {
//             // التعامل مع المدخلات إذا كان نص الإجابة مطلوبًا
//           },
//         ),
//         SizedBox(height: 20),
//         ...widget.quizModel.options.map(
//           (option) {
//             int index = widget.quizModel.options.indexOf(option);
//             return GestureDetector(
//               onTap: () => _handleAnswer(index),
//               child: Container(
//                 margin: EdgeInsets.symmetric(vertical: 8),
//                 padding: EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: selectedAnswerIndex == index
//                       ? (option.isCorrect ? Colors.green : Colors.red)
//                       : Colors.grey[300],
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(option.answerText),
//                     if (selectedAnswerIndex == index)
//                       Icon(
//                         option.isCorrect
//                             ? Icons.check_circle
//                             : Icons.cancel,
//                         color: option.isCorrect ? Colors.green : Colors.red,
//                       ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ).toList(),
//       ],
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:ui_flutter/model/quiz_model.dart';
// import 'package:ui_flutter/service/remote_source.dart';

// class AddQuizPage extends StatelessWidget {
//   AddQuizPage({super.key});
//   final RemoteSource service = RemoteSource();

//   final PageController _pageController = PageController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("اختبار المعرفة")),
//       body: FutureBuilder<List<QuizModel>>(
//         future: service.getAll(), // استخدام دالة getAll لجلب البيانات
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }

//           if (snapshot.hasError) {
//             return Center(child: Text("حدث خطأ في جلب البيانات"));
//           }

//           if (snapshot.hasData) {
//             List<QuizModel> quizzes = snapshot.data!;
//             return PageView.builder(
//               controller: _pageController,
//               itemCount: quizzes.length,
//               itemBuilder: (context, index) {
//                 return QuizQuestionPage(
//                   quizModel: quizzes[index],
//                   onAnswered: (isCorrect) {
//                     // إذا كانت الإجابة صحيحة، انتقل إلى السؤال التالي
//                     if (isCorrect) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text("إجابة صحيحة!"),backgroundColor: isCorrect ? Colors.green : Colors.red,),
                        
//                       );
//                       // الانتقال إلى السؤال التالي
//                       Future.delayed(Duration(seconds: 1), () {
//                         if (index < quizzes.length - 1) {
//                           _pageController.nextPage(
//                             duration: Duration(milliseconds: 300),
//                             curve: Curves.easeIn,
//                           );
//                         }
//                       });
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text("إجابة خاطئة!")),
//                       );
//                     }
//                   },
//                 );
//               },
//             );
//           }

//           return Center(child: Text("لا توجد أسئلة"));
//         },
//       ),
//     );
//   }
// }

// class QuizQuestionPage extends StatelessWidget {
//   final QuizModel quizModel;
//   final Function(bool) onAnswered;

//   const QuizQuestionPage({
//     super.key,
//     required this.quizModel,
//     required this.onAnswered,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Text(
//             quizModel.questionText,
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             textAlign: TextAlign.center,
//           ),
//         ),
//         // إضافة TextField لكل جواب
//         ...quizModel.options.map(
//           (option) {
//             int index = quizModel.options.indexOf(option);
//             return Padding(
//               padding: const EdgeInsets.symmetric(vertical: 8.0),
//               child: Column(
//                 children: [
//                   TextField(
                   
//                     onChanged: (value) {
//                       // التعامل مع النص المدخل (إذا كان مطلوبًا التحقق من النص)
//                     },
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       bool isCorrect = option.isCorrect;
//                       onAnswered(isCorrect);  // نمرر النتيجة
//                     },
//                     child: Container(
//                       padding: EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         color: Colors.grey[300],
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(option.answerText),
//                           // إضافة رمز صحيح أو خاطئ عند اختيار الإجابة
//                           // Icon(
//                           //   option.isCorrect
//                           //       ? Icons.check_circle
//                           //       : Icons.cancel,
//                           //   color: option.isCorrect
//                           //       ? Colors.green
//                           //       : Colors.red,
//                           // ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ).toList(),
//       ],
//     );
//   }
// }








/*
import 'package:flutter/material.dart';
import 'package:ui_flutter/model/quiz_model.dart';
import 'package:ui_flutter/service/remote_source.dart';

///////////////////////////////////////////////////////




class AddQuizPage extends StatelessWidget {
  AddQuizPage({super.key});
  TextEditingController question = TextEditingController();

  TextEditingController answer1 = TextEditingController();
  TextEditingController answer2 = TextEditingController();
  TextEditingController answer3 = TextEditingController();
  TextEditingController answer4 = TextEditingController();
  TextEditingController indexOfCorrect = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: TextField(
                  // enabled: false,
                  controller: question,
                  onChanged: (value) {
                    // print(value);
                    // print(controller.text);
                  },
                  // obscureText: true,
                  // dragStartBehavior: DragStartBehavior.start,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter your question',
                    helperText: 'Enter Helper',
                    labelText: 'Enter Label',

                    // fillColor: Colors.red,
                    // filled: true,
                    suffixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: TextField(
                  // enabled: false,
                  controller: answer1,
                  onChanged: (value) {
                    // print(value);
                    // print(controller.text);
                  },
                  // obscureText: true,
                  // dragStartBehavior: DragStartBehavior.start,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter your question',
                    helperText: 'Enter Helper',
                    labelText: 'Enter Label',

                    // fillColor: Colors.red,
                    // filled: true,
                    suffixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: TextField(
                  // enabled: false,
                  controller: answer2,
                  onChanged: (value) {
                    // print(value);
                    // print(controller.text);
                  },
                  // obscureText: true,
                  // dragStartBehavior: DragStartBehavior.start,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter your question',
                    helperText: 'Enter Helper',
                    labelText: 'Enter Label',

                    // fillColor: Colors.red,
                    // filled: true,
                    suffixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: TextField(
                  // enabled: false,
                  controller: answer3,
                  onChanged: (value) {
                    // print(value);
                    // print(controller.text);
                  },
                  // obscureText: true,
                  // dragStartBehavior: DragStartBehavior.start,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter your question',
                    helperText: 'Enter Helper',
                    labelText: 'Enter Label',

                    // fillColor: Colors.red,
                    // filled: true,
                    suffixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: TextField(
                  // enabled: false,
                  controller: answer4,
                  onChanged: (value) {
                    // print(value);
                    // print(controller.text);
                  },
                  // obscureText: true,
                  // dragStartBehavior: DragStartBehavior.start,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter your question',
                    helperText: 'Enter Helper',
                    labelText: 'Enter Label',

                    // fillColor: Colors.red,
                    // filled: true,
                    suffixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: TextField(
                  // enabled: false,
                  controller: indexOfCorrect,
                  onChanged: (value) {
                    // print(value);
                    // print(controller.text);
                  },
                  // obscureText: true,
                  // dragStartBehavior: DragStartBehavior.start,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter your question',
                    helperText: 'Enter Helper',
                    labelText: 'Enter Label',

                    // fillColor: Colors.red,
                    // filled: true,
                    suffixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            // this is a container like button with good decoration
            InkWell(
              onTap: () {
                List<Options> options = [];
                if (int.parse(indexOfCorrect.text) >= 0 &&
                    int.parse(indexOfCorrect.text) < 4) {
                  options = [
                    Options(answerText: answer1.text, isCorrect: false),
                    Options(answerText: answer2.text, isCorrect: false),
                    Options(answerText: answer3.text, isCorrect: false),
                    Options(answerText: answer4.text, isCorrect: false),
                  ];
                  for (int i = 0; i < 4; i++) {
                    if (i == int.parse(indexOfCorrect.text)) {
                      options[i].isCorrect = true;
                    }
                  }
                }
                QuizModel quiz = QuizModel(
                  questionText: question.text,
                  options: options,
                );
                RemoteSource().createNewQuiz(quiz);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),

                width: 300,
                height: 54,
                child: Center(child: Text('Click me')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

*/