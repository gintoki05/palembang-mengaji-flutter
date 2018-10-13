import 'package:flutter/material.dart';

import '../pages/hari_details.dart';

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

  void _navigateToHariPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return Scaffold(
            body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
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
          body: Center(child: HariDetails()),
        ));
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
