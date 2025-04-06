// ignore: depend_on_referenced_packages
// import 'package:dio/dio.dart';

// import 'package:ui_flutter/model/quiz_model.dart';

// class RemoteSource {
//   Dio dio = Dio();
//   String url = "https://676bde06bc36a202bb85fc11.mockapi.io/Quiz/";
//   late Response response;

//   Future<QuizModel?> getData(String id) async {
//     try {
//       response = await dio.get(url + id);

//       print("Response status: ${response.statusCode}");
//       return QuizModel.fromMap(response.data);
//     } catch (e) {
//       print("Error fetching data: $e");
//     }
//   }

//   Future<List<QuizModel>> getAll() async {
//     try {
//       response = await dio.get(url);
//       List<QuizModel> furits = [];
//       for (var i = 0; i < response.data['products'].length; i++) {
//         furits.add(QuizModel.fromMap(response.data['products'][i]));
//       }
//       return furits;
//     } catch (e) {
//       print(e);
//       return [];
//     }
//   }
// }




import 'package:dio/dio.dart';
import 'package:ui_flutter/model/quiz_model.dart';

class RemoteSource {
  Dio dio = Dio();
  String baseUrl = "https://676bde06bc36a202bb85fc11.mockapi.io/Quiz/";
  late Response response;

  Future<QuizModel?> getData(String id) async {
    try {
      response = await dio.get(baseUrl + id);
      QuizModel quiz = QuizModel.fromMap(response.data);
      return quiz;
    } catch (e) {
      print(e);
      return null;
    }
  }
/*
  Future<List<QuizModel>> getAll() async {
    try {
      response = await dio.get(baseUrl);
      List<QuizModel> quizList = List.generate(
        response.data.length,
        (index) => QuizModel.fromMap(response.data[index]),
      );
      return quizList;
    } catch (e) {
      print(e);
      return [];
    }
  }
*/

//// او   ولكن  اول  افضل 

Future<List<QuizModel>> getAll() async {
    try {
      response = await dio.get(baseUrl);
      List<QuizModel> furits = [];
      for (var i = 0; i < response.data.length; i++) {
        furits.add(QuizModel.fromMap(response.data[i]));
      }
      return furits;
    } catch (e) {
      print(e);
      return [];
    }
  }

  ///
  createNewQuiz(QuizModel quiz) async {
    try {
      print(quiz.toMap());
      response = await dio.post(baseUrl, data: quiz.toMap());
      print(response.data);
    } catch (e) {
      print(e);
    }
  }
  
}