import 'package:dio/dio.dart';
import 'package:ecomarce/model/modelecomarce.dart';

class QuizService {
  Dio dio = Dio();
  String baseUrl =
      "https://www.themealdb.com/api/json/v1/1/filter.php?a=Canadian";
  late Response response;

  Future<modelecomarce?> getOnemeal(String id) async {
    try {
      response = await dio.get(baseUrl + id);
      modelecomarce quiz = modelecomarce.fromMap(response.data);
      return quiz;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<modelecomarce>> getAlleMeal() async {
    try {
      response = await dio.get(baseUrl);
      print(response);
      List<modelecomarce> quizList = List.generate(
        response.data["meals"].length,
        (index) => modelecomarce.fromMap(response.data["meals"][index]),
      );
      return quizList;
    } catch (e) {
      print(e);
      return [];
    }
  }

  //   Future<List<modelecomarce>> getAlleMeal() async {
  //   try {
  //     response = await dio.get(baseUrl);
  //     List data = response.data['meals'];
  //     List<modelecomarce> quizList = data
  //         .map((item) => modelecomarce.fromMap(item))
  //         .toList();
  //     return quizList;
  //   } catch (e) {
  //     print(e);
  //     return [];
  //   }
  // }
}
