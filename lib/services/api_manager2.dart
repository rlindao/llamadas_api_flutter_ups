import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import '../constants/strings2.dart';
import '../models/newsInfo2.dart';

// ignore: camel_case_types
class API_Manager {
  Future<List<Typicode>> getNews() async {
    var client = http.Client();
    var typicode;
    List<Typicode> registers = [];
    //final url = Uri.https(Strings.newsurl,,);
    // Conversion de String to Uri
    Uri uri = Uri.parse(Strings.newsurl);
    try {
      var response = await client.get(uri);
      print('response.statusCode');
      print(response.statusCode );
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        for(var u in jsonMap) {
          Typicode register = Typicode( userId: u["userId"]  , id: u["id"], title: u["title"], body: u["body"] );
          registers.add(register);
        }

        print(registers.length);
        print(registers);
        print('jsonMap' );
        //print(jsonMap );
        //print(jsonMap);
        //typicode = jsonMap.map((job) => new Typicode.fromJson(job)).toList();
        typicode = Typicode.fromJson(jsonMap[1]);
        print(typicode);
        //print(typicode );
      }
    } catch (Exception) {
      print('Errors');
      print(Exception);
      return registers;
    }

    return registers;
  }
}
