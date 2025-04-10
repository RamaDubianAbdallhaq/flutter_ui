import 'dart:developer';

import 'package:bottom_navigation_bar/model/news_model.dart';
import 'package:dio/dio.dart';


class NewsService {
  static String APIKEY = "a09692ca635241af8645ddeee3503a9b";
  late Response response;
  String baseurl =
      "https://newsapi.org/v2/everything?q=tesla&from=2025-04-05&sortBy=publishedAt&apiKey=$APIKEY";
  Dio dio = Dio();

  Future<List<NewsModel>> getNews() async {
    try {
      response = await dio.get(baseurl);
      List<NewsModel> news = [];

      for (var i = 0; i < response.data['articles'].length; i++) {
        news.add(NewsModel.fromMap(response.data['articles'][i]));
      }
      return news;
      
    } catch (e) {
      print(e);
      return [];
    }
  }
}