import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../models/info.dart';

class InfoDetails extends StatelessWidget {
  final Info info;

  InfoDetails({Key key, @required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${info.judul}"),
      ),
      body: Container(
          child: ListView(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: '${info.foto}',
                fit: BoxFit.cover,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  '${info.tanggal}',
                  style: TextStyle(fontSize: 10.0, color: Colors.grey),
                ),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 1.0),
                  child: Text(
                    '${info.deskripsi}',
                    style: TextStyle(fontFamily: 'Garamont', fontSize: 15.0),
                    textAlign: TextAlign.justify,
                  ))
            ],
          )),
    );
  }
}


