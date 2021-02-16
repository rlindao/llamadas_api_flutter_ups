import 'dart:convert';

//Typicode typicodeFromJson(String str) => Typicode.fromJson(json.decode(str));
//String typicodeToJson(Typicode data) => json.encode(data.toJson());


List<Typicode> typicodeFromJson(String str) => List<Typicode>.from(json.decode(str).map((x) => Typicode.fromJson(x)));
String typicodeToJson(List<Typicode> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Typicode {
    
    Typicode({
        this.userId,
        this.id,
        this.title,
        this.body,
    });

    final int userId;
    final int id;
    final String title;
    final String body;


    
    factory Typicode.fromJson(Map<String, dynamic> json) => Typicode(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}




