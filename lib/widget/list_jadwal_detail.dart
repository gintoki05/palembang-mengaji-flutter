import 'package:flutter/material.dart';

import '../models/hari.dart';
import '../api/list_jadwal.dart';

Widget listJadwalSection = new FutureBuilder<List<Hari>>(
  future: fetchJadwalFromAPI(),
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      return new ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            return new Card(
                child: new Row(children: <Widget>[
              new Column(
                children: <Widget>[new Text('Masjid :')],
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    snapshot.data[index].masjid,
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ]));
          });
    } else if (snapshot.hasError) {
      return new Text("${snapshot.error}");
    }

// By default, show a loading spinner
    return new CircularProgressIndicator();
  },
);

