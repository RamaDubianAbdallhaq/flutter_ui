// import 'package:flutter/material.dart';
// import 'package:ui_flutter/model/quiz_model.dart';
// import 'package:ui_flutter/service/remote_source.dart';

// class RemoteData extends StatelessWidget {
//  RemoteData({super.key});
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
//       body: SizedBox(
//         width: 360,
//         height: 617,

//         child: Container(
//             color: Color.fromRGBO(141, 55, 111, 1),
//           child: FutureBuilder<List<QuizModel>>(
//             future:service. getAll(), // استخدام دالة getAll لجلب البيانات
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(child: CircularProgressIndicator());
//               }

//               if (snapshot.hasError) {
//                 return Center(child: Text(" error"));
//               }

//               if (snapshot.hasData) {
//                 List<QuizModel> quizzes = snapshot.data!;
//                 return PageView.builder(
//                   controller: _pageController,
//                   itemCount: quizzes.length,
//                   itemBuilder: (context, index) {
//                     return QuizQuestionPage(
//                       quizModel: quizzes[index],
//                       onAnswered: (isCorrect) {
//                         // إذا كانت الإجابة صحيحة، انتقل إلى السؤال التالي
//                         if (isCorrect) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(content: Text(" ✔️Correct"), backgroundColor:  Colors.green, behavior: SnackBarBehavior.floating,
//         duration: Duration(seconds: 1),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)), ),
//                           );
//                           // الانتقال إلى السؤال التالي
//                           Future.delayed(Duration(seconds: 1), () {
//                             if (index < quizzes.length - 1) {
//                               _pageController.nextPage(
//                                 duration: Duration(milliseconds: 300),
//                                 curve: Curves.easeIn,
//                               );
//                             }
//                           });
//                         } else {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(content: Text("❌Wrong!"), backgroundColor:   Colors.red, behavior: SnackBarBehavior.floating,
//         duration: Duration(seconds: 1),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),),
//                           );
//                         }
//                       },
//                     );
//                   },
//                 );
//               }

//               return Center(child: Text("لا توجد أسئلة"));
//             },
//           ),
//         ),
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
//            child: TextField(
//             enabled: false,
//                     decoration: InputDecoration(
//                       labelText:
//                       widget.quizModel.questionText,
//                       fillColor: Colors.white,
//                       filled: true,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),

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

// class RemoteData extends StatelessWidget {
//   RemoteData({super.key});
//   final RemoteSource service = RemoteSource();
//   final PageController _pageController = PageController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(" quize app")),
//       body: SizedBox(
//         width: 360,
//         height: 617,
//         child: Container(
//           color: Color.fromRGBO(141, 55, 111, 1),
//           child: FutureBuilder<List<QuizModel>>(
//             future: service.getAll(), // استخدام دالة getAll لجلب البيانات
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(child: CircularProgressIndicator());
//               }

//               if (snapshot.hasError) {
//                 return Center(child: Text("حدث خطأ"));
//               }

//               if (snapshot.hasData) {
//                 List<QuizModel> quizzes = snapshot.data!;
//                 return PageView.builder(
//                   controller: _pageController,
//                   itemCount: quizzes.length,
//                   itemBuilder: (context, index) {
//                     return QuizQuestionPage(
//                       quizModel: quizzes[index],
//                       onAnswered: (isCorrect) {
//                         // إذا كانت الإجابة صحيحة، انتقل إلى السؤال التالي
//                         if (isCorrect) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Text(" ✔️الإجابة صحيحة"),
//                               backgroundColor: Colors.green,
//                               behavior: SnackBarBehavior.floating,
//                               duration: Duration(seconds: 1),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(15),
//                               ),
//                             ),
//                           );
//                           // الانتقال إلى السؤال التالي
//                           Future.delayed(Duration(seconds: 1), () {
//                             if (index < quizzes.length - 1) {
//                               _pageController.nextPage(
//                                 duration: Duration(milliseconds: 300),
//                                 curve: Curves.easeIn,
//                               );
//                             }
//                           });
//                         } else {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Text("❌ الإجابة خاطئة"),
//                               backgroundColor: Colors.red,
//                               behavior: SnackBarBehavior.floating,
//                               duration: Duration(seconds: 1),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(15),
//                               ),
//                             ),
//                           );
//                         }
//                       },
//                     );
//                   },
//                 );
//               }

//               return Center(child: Text("لا توجد أسئلة"));
//             },
//           ),
//         ),
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
//     // إضافة TextEditingController لعرض السؤال
//     TextEditingController _answerController = TextEditingController();
//      TextEditingController answer1 = TextEditingController();
//   TextEditingController answer2 = TextEditingController();
//   TextEditingController answer3 = TextEditingController();
//   TextEditingController answer4 = TextEditingController();

//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: TextField(
//             enabled: false, // جعل TextField غير قابل للتعديل
//             decoration: InputDecoration(
//               labelText: quizModel.questionText,
//               fillColor: Colors.white,
//               filled: true,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//             ),
//           ),
//         ),
//         SizedBox(height: 20),
//         // خيارات الإجابة
//         ...quizModel.options.map((option) {

//           int index = quizModel.options.indexOf(option);
//          return TextField(
//           enabled: false, // جعل TextField غير قابل للتعديل
//             decoration: InputDecoration(
//               labelText: quizModel.questionText,
//               fillColor: Colors.white,
//               filled: true,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//             ),
//           controller: answer1,

//           onSubmitted: (value) {
//             // التحقق من الإجابة
//             bool isCorrect = false;
//             for (var option in quizModel.options) {
//               if (option.answerText == value && option.isCorrect) {
//                 isCorrect = true;
//                 break;
//               }
//             }
//             onAnswered(isCorrect); // تمرير الإجابة الصحيحة/الخاطئة
//           },
//         );
//         SizedBox(height: 20);

//           // return GestureDetector(
//           //   onTap: () {
//           //     bool isCorrect = option.isCorrect;
//           //     onAnswered(isCorrect); // تمرير الإجابة الصحيحة/الخاطئة
//           //   },
//           //   child: Container(
//           //     margin: EdgeInsets.symmetric(vertical: 8),
//           //     padding: EdgeInsets.all(16),
//           //     decoration: BoxDecoration(
//           //       color: Colors.grey[300],
//           //       borderRadius: BorderRadius.circular(8),
//           //     ),
//           //     child: Row(
//           //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //       children: [Text(option.answerText)],
//           //     ),
//           //   ),
//           // );
//         }).toList(),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:ui_flutter/model/quiz_model.dart';
import 'package:ui_flutter/service/remote_source.dart';

class RemoteData extends StatelessWidget {
  RemoteData({super.key});
  final RemoteSource service = RemoteSource();
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz App")),
      body: SizedBox(
        width: 360,
        height: 617,
        child: Container(
          color: Color.fromRGBO(141, 55, 111, 1),
          child: FutureBuilder<List<QuizModel>>(
            future: service.getAll(), 
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text("حدث خطأ"));
              }

              if (snapshot.hasData) {
                List<QuizModel> quizzes = snapshot.data!;
                return PageView.builder(
                  controller: _pageController,
                  itemCount: quizzes.length,
                  itemBuilder: (context, index) {
                    return QuizQuestionPage(
                      quizModel: quizzes[index],
                      onAnswered: (isCorrect) {
                       
                        if (isCorrect) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("  صحيحة"),
                              backgroundColor: Colors.green,
                              behavior: SnackBarBehavior.floating,
                              duration: Duration(seconds: 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          );
                         
                          Future.delayed(Duration(seconds: 1), () {
                            if (index < quizzes.length - 1) {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                              );
                            } else {
                              // 🚀 الانتقال إلى صفحة جديدة بعد آخر سؤال
                              // Navigator.pushReplacement(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => AddQuestionBottomSheet(onSave: (QuizModel ) {  },),
                              //   ),
                              // );

                              // showModalBottomSheet(
                              //   context: context,
                              //   isScrollControlled:
                              //       true, // للسماح بالتمدد الكامل إذا لزم الأمر
                              //   builder: (context) {
                              //     return AddQuestionBottomSheet(
                              //       onSave: (quizModel) {
                              //         // يمكنك تنفيذ أي إجراء عند الحفظ، مثل إغلاق `BottomSheet`
                              //         Navigator.pop(context);
                              //       },
                              //     );
                              //   },
                              // );

                              // _showAddQuestionDialog(context);
                            }
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(" الإجابة خاطئة"),
                              backgroundColor: Colors.red,
                              behavior: SnackBarBehavior.floating,
                              duration: Duration(seconds: 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          );
                        }
                      },
                    );
                  },
                );
              }

              return Center(
                child: Text(
                  "////////////////////////",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                    color: Color.fromRGBO(19, 19, 19, 1),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // void _showAddQuestionDialog(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (context) {
  //       return AddQuestionBottomSheet(
  //         onSave: (quizModel) {
  //           // إضافة السؤال إلى قاعدة البيانات
  //           service.createNewQuiz(quizModel);
  //           Navigator.pop(context); // إغلاق الـ BottomSheet بعد حفظ السؤال
  //         },
  //       );
  //     },
  //   );
  // }

}

class QuizQuestionPage extends StatelessWidget {
  final QuizModel quizModel;
  // final QuizModel Options;
  final Function(bool) onAnswered;

  const QuizQuestionPage({
    super.key,
    required this.quizModel,
    required this.onAnswered,
    // required this.Options,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            enabled: false, // جعل TextField غير قابل للتعديل
            decoration: InputDecoration(
              labelText: quizModel.questionText,
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),

        // InkWell
        // (
        //   //  onTap: () {
        //   //   bool isCorrect = option.isCorrect; // تحقق مما إذا كانت الإجابة صحيحة
        //   //   onAnswered(isCorrect); // استدعاء دالة onAnswered وتمرير الإجابة الصحيحة أو الخاطئة
        //   // },
        //   child: Padding(

        //     padding: const EdgeInsets.all(16.0),
        //     child: Column(
        //       children: quizModel.options.map((option) {
        //         return TextField(
        //           enabled: false, // غير قابل للتعديل
        //           decoration: InputDecoration(
        //             labelText: option.answerText, // الوصول إلى الإجابة
        //             fillColor: Colors.white,
        //             filled: true,
        //             border: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(12),
        //             ),
        //           ),
        //         );
        //       }).toList(),
        //     ),
        //   ),
        // ),
        SizedBox(height: 20),

        ...quizModel.options.map((option) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: InkWell(
              // GestureDetector
              onTap: () {
                bool isCorrect = option.isCorrect;
                onAnswered(isCorrect); 
              },
              child: TextField(
                enabled: false, 
                decoration: InputDecoration(
                  labelText: option.answerText,
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ],
    );
  }
}

// class AddQuestionBottomSheet extends StatefulWidget {
//   final Function(QuizModel) onSave;

//   const AddQuestionBottomSheet({Key? key, required this.onSave})
//     : super(key: key);

//   @override
//   _AddQuestionBottomSheetState createState() => _AddQuestionBottomSheetState();
// }

// class _AddQuestionBottomSheetState extends State<AddQuestionBottomSheet> {
//   final TextEditingController questionController = TextEditingController();
//   final TextEditingController option1Controller = TextEditingController();
//   final TextEditingController option2Controller = TextEditingController();
//   final TextEditingController option3Controller = TextEditingController();
//   final TextEditingController option4Controller = TextEditingController();

//   String correctOption = '';

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TextField(
//             controller: questionController,
//             decoration: InputDecoration(
//               labelText: 'أدخل السؤال',
//               border: OutlineInputBorder(),
//             ),
//           ),
//           SizedBox(height: 10),
//           TextField(
//             controller: option1Controller,
//             decoration: InputDecoration(
//               labelText: 'الخيار 1',
//               border: OutlineInputBorder(),
//             ),
//           ),
//           SizedBox(height: 10),
//           TextField(
//             controller: option2Controller,
//             decoration: InputDecoration(
//               labelText: 'الخيار 2',
//               border: OutlineInputBorder(),
//             ),
//           ),
//           SizedBox(height: 10),
//           TextField(
//             controller: option3Controller,
//             decoration: InputDecoration(
//               labelText: 'الخيار 3',
//               border: OutlineInputBorder(),
//             ),
//           ),
//           SizedBox(height: 10),
//           TextField(
//             controller: option4Controller,
//             decoration: InputDecoration(
//               labelText: 'الخيار 4',
//               border: OutlineInputBorder(),
//             ),
//           ),
//           SizedBox(height: 10),
//           DropdownButton<String>(
//             isExpanded: true,
//             value: correctOption.isEmpty ? null : correctOption,
//             hint: Text('اختر الإجابة الصحيحة'),
//             onChanged: (value) {
//               setState(() {
//                 correctOption = value!;
//               });
//             },
//             items:
//                 ['الخيار 1', 'الخيار 2', 'الخيار 3', 'الخيار 4'].map((option) {
//                   return DropdownMenuItem<String>(
//                     value: option,
//                     child: Text(option),
//                   );
//                 }).toList(),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {
//               // إضافة السؤال الجديد إلى قاعدة البيانات
//               if (questionController.text.isNotEmpty &&
//                   option1Controller.text.isNotEmpty &&
//                   option2Controller.text.isNotEmpty &&
//                   option3Controller.text.isNotEmpty &&
//                   option4Controller.text.isNotEmpty &&
//                   correctOption.isNotEmpty) {
//                 final newQuiz = QuizModel(
//                   questionText: questionController.text,
//                   options: [
//                     Options(
//                       answerText: option1Controller.text,
//                       isCorrect: correctOption == 'الخيار 1',
//                     ),
//                     Options(
//                       answerText: option2Controller.text,
//                       isCorrect: correctOption == 'الخيار 2',
//                     ),
//                     Options(
//                       answerText: option3Controller.text,
//                       isCorrect: correctOption == 'الخيار 3',
//                     ),
//                     Options(
//                       answerText: option4Controller.text,
//                       isCorrect: correctOption == 'الخيار 4',
//                     ),
//                   ],
//                 );
//                 widget.onSave(newQuiz);
//               }
//             },
//             child: Text('حفظ السؤال'),
//           ),
//         ],
//       ),
//     );
//   }
// }
