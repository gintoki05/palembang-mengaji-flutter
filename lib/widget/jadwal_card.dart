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

  void _navigateToHariPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return Scaffold(

          body: HariDetails(),
        );
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
