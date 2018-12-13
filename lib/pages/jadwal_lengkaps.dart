import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_html_view/flutter_html_view.dart';

Future<Post> fetchPost() async {
  final response = await http
      .get('http://palembangmengaji.forkismapalembang.com/jadwallengkap.php');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class Post {
  final String jadwal;

  Post({this.jadwal});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      jadwal: json['jadwal'],
    );
  }
}

class JadwalLengkaps extends StatelessWidget {
  final Future<Post> post;

  JadwalLengkaps({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
              "http://palembangmengaji.forkismapalembang.com/gambar/jadwalkajian.png",
              fit: BoxFit.cover,
            )),
          ),
        ];
      },
      body: ListView(
        children: <Widget>[
          Center(
            child: FutureBuilder<Post>(
              future: fetchPost(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return HtmlView(data: snapshot.data.jadwal);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // By default, show a loading spinner
                return CircularProgressIndicator();
              },
            ),
          )
        ],
      ),
    );
  }
}
