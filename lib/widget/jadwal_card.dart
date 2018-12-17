import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../models/hari.dart';

class JadwalList extends StatelessWidget {
  final String judul;
  final String gambar;
  final String url;
  final String hari;

  const JadwalList({
    Key key,
    @required this.judul,
    @required this.gambar,
    @required this.url,
    @required this.hari,
  })  : assert(judul != null),
        assert(gambar != null),
        assert(url != null),
        assert(hari != null),
        super(key: key);

  Future<List<Hari>> fetchJadwalFromAPI() async {
    final response = await http.get(hari);
    print(response.body);
    List responseJson = json.decode(response.body.toString());
    List<Hari> jadwalList = createJadwalList(responseJson);
    return jadwalList;
  }

  List<Hari> createJadwalList(List data) {
    List<Hari> list = List();
    for (int i = 0; i < data.length; i++) {
      String masjid = data[i]["masjid"];
      String id = data[i]["id"];
      String waktu = data[i]["waktu"];
      String pengisi = data[i]["pengisi"];
      String tema = data[i]["tema"];
      String tanggal = data[i]["tanggal"];
      String kategori = data[i]["kategori"];
      Hari jadwal = Hari(
          masjid: masjid,
          id: id,
          waktu: waktu,
          pengisi: pengisi,
          tema: tema,
          tanggal: tanggal,
          kategori: kategori);
      list.add(jadwal);
    }
    return list;
  }

  void _navigateToHariPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return Scaffold(
            body: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      expandedHeight: 200.0,
                      floating: false,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                          title: Text(judul,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              )),
                          background: Image.network(
                            url,
                            fit: BoxFit.cover,
                          )),
                    ),
                  ];
                },
                body: Center(
                    child: FutureBuilder<List<Hari>>(
                  future: fetchJadwalFromAPI(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return Card(
                                child: Column(
                              children: <Widget>[
                                Row(children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        snapshot.data[index].tanggal,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11.0,
                                            color: Colors.grey),
                                      ),
                                    ),
                                  )
                                ]),
                                Row(children: <Widget>[
                                  Container(
                                    margin:
                                        EdgeInsets.fromLTRB(6.0, 0.0, 0.0, 0.0),
                                    child: Icon(
                                      Icons.map,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        snapshot.data[index].masjid,
                                        style: TextStyle(
                                            fontFamily: 'Merriweather-Regular'),
                                      ),
                                    ),
                                  )
                                ]),
                                Row(children: <Widget>[
                                  Container(
                                    margin:
                                        EdgeInsets.fromLTRB(6.0, 0.0, 0.0, 0.0),
                                    child: Icon(
                                      Icons.access_time,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        snapshot.data[index].waktu,
                                        style: TextStyle(
                                            fontFamily: 'Merriweather-Regular'),
                                      ),
                                    ),
                                  )
                                ]),
                                Row(children: <Widget>[
                                  Container(
                                    margin:
                                        EdgeInsets.fromLTRB(6.0, 0.0, 0.0, 0.0),
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        snapshot.data[index].pengisi,
                                        style: TextStyle(
                                            fontFamily: 'Merriweather-Regular'),
                                      ),
                                    ),
                                  )
                                ]),
                                Row(children: <Widget>[
                                  Container(
                                    margin:
                                        EdgeInsets.fromLTRB(6.0, 0.0, 0.0, 0.0),
                                    child: Icon(
                                      Icons.book,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        snapshot.data[index].tema,
                                        style: TextStyle(
                                            fontFamily: 'Merriweather-Regular'),
                                      ),
                                    ),
                                  )
                                ]),
                                Row(children: <Widget>[
                                  Container(
                                    margin:
                                        EdgeInsets.fromLTRB(6.0, 0.0, 0.0, 0.0),
                                    child: Icon(
                                      Icons.group_work,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        snapshot.data[index].kategori,
                                        style: TextStyle(
                                            fontFamily: 'Merriweather-Regular'),
                                      ),
                                    ),
                                  )
                                ]),
                              ],
                            ));
                          });
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

// By default, show a loading spinner
                    return CircularProgressIndicator();
                  },
                ))));
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5.0),
        child: Center(
            child: InkWell(
                onTap: () => _navigateToHariPage(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Card(
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            gambar,
                            width: 100.0,
                          ),
                          Container(
                              padding: EdgeInsets.all(30.0),
                              child: Center(
                                  child: Column(
                                children: <Widget>[
                                  Text(
                                    judul,
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'LibreFranklin-Medium',
                                        color: Colors.blue),
                                  )
                                ],
                              )))
                        ],
                      ),
                    )
                  ],
                ))));
  }
}
