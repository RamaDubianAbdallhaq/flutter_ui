import 'package:flutter/material.dart';
import 'package:ui_flutter/model/quiz_model.dart';
import 'package:ui_flutter/service/remote_source.dart';

class RemoteDataa extends StatelessWidget {
  RemoteDataa({super.key});
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
            future: service.getAll(), // استخدام دالة getAll لجلب البيانات
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
                        // إذا كانت الإجابة صحيحة، انتقل إلى السؤال التالي
                        if (isCorrect) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(" ✔️الإجابة صحيحة"),
                              backgroundColor: Colors.green,
                              behavior: SnackBarBehavior.floating,
                              duration: Duration(seconds: 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          );
                          // الانتقال إلى السؤال التالي
                          Future.delayed(Duration(seconds: 1), () {
                            if (index < quizzes.length - 1) {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                              );
                            } else {
                              // بعد الانتهاء من الأسئلة، عرض BottomSheet لإضافة سؤال جديد
                              _showAddQuestionDialog(context);
                            }
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("❌ الإجابة خاطئة"),
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

              return Center(child: Text("لا توجد أسئلة"));
            },
          ),
        ),
      ),
    );
  }

  // دالة لعرض BottomSheet لإضافة سؤال جديد
  void _showAddQuestionDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return AddQuestionBottomSheet(onSave: (quizModel) {
          // إضافة السؤال إلى قاعدة البيانات
          service.addQuiz(quizModel);
          Navigator.pop(context); // إغلاق الـ BottomSheet بعد حفظ السؤال
        });
      },
    );
  }
}

// نموذج سؤال الاختبار مع خياراته
class QuizQuestionPage extends StatelessWidget {
  final QuizModel quizModel;
  final Function(bool) onAnswered;

  const QuizQuestionPage({
    super.key,
    required this.quizModel,
    required this.onAnswered,
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
        // عرض خيارات الإجابة
        ...quizModel.options.map((option) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: InkWell(
              onTap: () {
                // التحقق من الإجابة عند النقر
                bool isCorrect = option.isCorrect;
                onAnswered(isCorrect); // تمرير الإجابة الصحيحة/الخاطئة
              },
              child: TextField(
                enabled: false, // جعل TextField غير قابل للتعديل
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

// نموذج لاضافة سؤال جديد
class AddQuestionBottomSheet extends StatefulWidget {
  final Function(QuizModel) onSave;

  const AddQuestionBottomSheet({Key? key, required this.onSave}) : super(key: key);

  @override
  _AddQuestionBottomSheetState createState() => _AddQuestionBottomSheetState();
}

class _AddQuestionBottomSheetState extends State<AddQuestionBottomSheet> {
  final TextEditingController questionController = TextEditingController();
  final TextEditingController option1Controller = TextEditingController();
  final TextEditingController option2Controller = TextEditingController();
  final TextEditingController option3Controller = TextEditingController();
  final TextEditingController option4Controller = TextEditingController();

  String correctOption = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: questionController,
            decoration: InputDecoration(
              labelText: 'أدخل السؤال',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: option1Controller,
            decoration: InputDecoration(
              labelText: 'الخيار 1',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: option2Controller,
            decoration: InputDecoration(
              labelText: 'الخيار 2',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: option3Controller,
            decoration: InputDecoration(
              labelText: 'الخيار 3',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: option4Controller,
            decoration: InputDecoration(
              labelText: 'الخيار 4',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          DropdownButton<String>(
            isExpanded: true,
            value: correctOption.isEmpty ? null : correctOption,
            hint: Text('اختر الإجابة الصحيحة'),
            onChanged: (value) {
              setState(() {
                correctOption = value!;
              });
            },
            items: [
              'الخيار 1',
              'الخيار 2',
              'الخيار 3',
              'الخيار 4',
            ].map((option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // إضافة السؤال الجديد إلى قاعدة البيانات
              if (questionController.text.isNotEmpty &&
                  option1Controller.text.isNotEmpty &&
                  option2Controller.text.isNotEmpty &&
                  option3Controller.text.isNotEmpty &&
                  option4Controller.text.isNotEmpty &&
                  correctOption.isNotEmpty) {
                final newQuiz = QuizModel(
                  questionText: questionController.text,
                  options: [
                    OptionModel(answerText: option1Controller.text, isCorrect: correctOption == 'الخيار 1'),
                    OptionModel(answerText: option2Controller.text, isCorrect: correctOption == 'الخيار 2'),
                    OptionModel(answerText: option3Controller.text, isCorrect: correctOption == 'الخيار 3'),
                    OptionModel(answerText: option4Controller.text, isCorrect: correctOption == 'الخيار 4'),
                  ],
                );
                widget.onSave(newQuiz);
              }
            },
            child: Text('حفظ السؤال'),
          ),
        ],
      ),
    );
  }
}

// نموذج QuizModel
class QuizModel {
  final String questionText;
  final List<OptionModel> options;

  QuizModel({required this.questionText, required this.options});
}

// نموذج OptionModel
class OptionModel {
  final String answerText;
  final bool isCorrect;

  OptionModel({required this.answerText, required this.isCorrect});
}

// مثال لخدمة إضافية تُمثل قاعدة البيانات
class RemoteSource {
  Future<List<QuizModel>> getAll() async {
    return [
      QuizModel(
        questionText: 'ما هي عاصمة فرنسا؟',
        options: [
          OptionModel(answerText: 'باريس', isCorrect: true),
          OptionModel(answerText: 'لندن', isCorrect: false),
          OptionModel(answerText: 'روما', isCorrect: false),
          OptionModel(answerText: 'مدريد', isCorrect: false),
        ],
      ),
    ];
  }

  void addQuiz(QuizModel quizModel) {
    // إضافة السؤال إلى قاعدة البيانات (مثال)
    print('تم إضافة السؤال: ${quizModel.questionText}');
  }
}
