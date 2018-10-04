import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../models/hari.dart';

class HariDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new FutureBuilder<List<User>>(
        future: fetchUsersFromGitHub(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return new ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(snapshot.data[index].name,
                            style: new TextStyle(fontWeight: FontWeight.bold)),
                        new Divider()
                      ]);
                });
          } else if (snapshot.hasError) {
            return new Text("${snapshot.error}");
          }

          // By default, show a loading spinner
          return new CircularProgressIndicator();
        },
      ),
    );
  }

  Future<List<User>> fetchUsersFromGitHub() async {
    final response = await http.get('http://palembangmengaji.forkismapalembang.com/api.php?hari=senin');
    print(response.body);
    List responseJson = json.decode(response.body.toString());
    List<User> userList = createUserList(responseJson);
    return userList;
  }

  List<User> createUserList(List data) {
    List<User> list = new List();
    for (int i = 0; i < data.length; i++) {
      String title = data[i]["masjid"];
      String id = data[i]["id"];
      User user = new User(name: title, id: id);
      list.add(user);
    }
    return list;
  }
}

class User {
  String name;
  String id;

  User({this.name, this.id});
}
