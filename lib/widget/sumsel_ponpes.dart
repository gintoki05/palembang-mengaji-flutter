import 'package:flutter/material.dart';

import '../pages/ponpes_details.dart';

class PonpesSumsel extends StatefulWidget {
  @override
  _PonpesSumselState createState() => _PonpesSumselState();
}

class _PonpesSumselState extends State<PonpesSumsel> {
  List<Container> daftarPonpes = List();

  var ponpes = [
    {
      "nama": "Prabumulih",
      "gambar":
          "http://palembangmengaji.forkismapalembang.com/gambar/kajian.jpg",
    },
    {
      "nama": "Muara Enim",
      "gambar":
          "http://palembangmengaji.forkismapalembang.com/gambar/kajian.jpg",
    },
    {
      "nama": "Martapura",
      "gambar":
          "http://palembangmengaji.forkismapalembang.com/gambar/kajian.jpg",
    },
    {
      "nama": "Masjid Bakti",
      "gambar":
          "http://palembangmengaji.forkismapalembang.com/gambar/kajian.jpg",
    },
    {
      "nama": "Masjid Bakti",
      "gambar":
          "http://palembangmengaji.forkismapalembang.com/gambar/kajian.jpg",
    },
    {
      "nama": "Masjid Bakti",
      "gambar":
          "http://palembangmengaji.forkismapalembang.com/gambar/kajian.jpg",
    },
  ];

  _buatlist() async {
    for (var i = 0; i < ponpes.length; i++) {
      final ponpesnya = ponpes[i];
      final String gambar = ponpesnya["gambar"];

      daftarPonpes.add(
        Container(
          padding: EdgeInsets.all(10.0),
          child: Card(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  child: Material(
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => PonpesDetail(
                                  nama: ponpesnya['nama'],
                                ),
                          )),
                      child: Image.network(
                        "$gambar",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0)),
                Container(
                    child: Text(
                      ponpesnya['nama'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 13.0),
                    ),
                    alignment: Alignment.center)
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    _buatlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: daftarPonpes,
    );
  }
}
