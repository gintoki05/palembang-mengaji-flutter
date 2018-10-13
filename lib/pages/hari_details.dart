import 'package:flutter/material.dart';

import '../widget/list_jadwal_detail.dart';
import '../models/hari.dart';
import '../api/list_jadwal.dart';
import '../widget/jadwal_card.dart';


class HariDetails extends StatefulWidget {
  @override
  _HariDetailsState createState() => _HariDetailsState();
}

class _HariDetailsState extends State<HariDetails> {
  @override
  Widget build(BuildContext context) {
    return new Container(
        child: FutureBuilder<List<Hari>>(
      future: fetchJadwalFromAPI(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return new ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return new Card(
                    child: new Column(
                  children: <Widget>[
                    new Row(children: <Widget>[
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            snapshot.data[index].tanggal,
                            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0, color: Colors.grey),
                          ),
                        ),
                      )
                    ]),
                    new Row(children: <Widget>[
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
                    ]),
                    new Row(children: <Widget>[
                      new Column(
                        children: <Widget>[new Text('Waktu :')],
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            snapshot.data[index].waktu,
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ]),
                    new Row(children: <Widget>[
                      new Column(
                        children: <Widget>[new Text('Pengisi :')],
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            snapshot.data[index].pengisi,
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ]),
                    new Row(children: <Widget>[
                      new Column(
                        children: <Widget>[new Text('Tema :')],
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            snapshot.data[index].tema,
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ]),
                    new Row(children: <Widget>[
                      new Column(
                        children: <Widget>[new Text('Kategori :')],
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            snapshot.data[index].kategori,
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ]),
                  ],
                ));
              });
        } else if (snapshot.hasError) {
          return new Text("${snapshot.error}");
        }

// By default, show a loading spinner
        return new CircularProgressIndicator();
      },
    ));
  }
}
