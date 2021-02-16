import 'package:flutter/material.dart';
import '../models/newsInfo2.dart';
import '../services/api_manager2.dart';
//import 'package:intl/intl.dart';
//import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Typicode>> _newsModel;

  @override
  void initState() {
    _newsModel = API_Manager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplo Api Rest'),
      ),
      body: Container(
        child: FutureBuilder<List<Typicode>>(
          future: _newsModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    var userId = snapshot.data[index].userId;
                    var id = snapshot.data[index].id;
                    var article = snapshot.data[index].title;
                    var body = snapshot.data[index].body ?? 'nulo' ;
                    
                    return Container(
                      height: 200,
                      margin: const EdgeInsets.all(8),
                      child: Row(
                        children: <Widget>[
                          Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('UserId:  ' + userId.toString() , 
                                      style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)
                                    ),
                                Text('id:  ' + id.toString()),
                                Text('title:  ' + article),
                                Text(
                                      body,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold
                                            ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            } else
              return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
