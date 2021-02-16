import 'dart:convert';

import 'package:http/http.dart' as http;
import '../constants/strings.dart';
import '../models/newsInfo.dart';

// ignore: camel_case_types
class API_Manager {
  Future<NewsModel> getNews() async {
    var client = http.Client();
    var newsModel;
    Uri uri = Uri.parse(Strings.newsurl);
    try {
      var response = await client.get(uri);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        
        newsModel = NewsModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      print('Errors');
      print(Exception);
      return newsModel;
    }

    return newsModel;
  }
}
