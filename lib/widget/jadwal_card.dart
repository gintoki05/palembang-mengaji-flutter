import 'package:flutter/material.dart';

import '../pages/hari_details.dart';

class JadwalList extends StatelessWidget {
  final String judul;
  final String gambar;

  const JadwalList({
    Key key,
    @required this.judul,
    @required this.gambar,
  })  : assert(judul != null),
        assert(gambar != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5.0),
        child: Center(
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => HariDetails()));
                },
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
                                        fontFamily: 'Oswald',
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
