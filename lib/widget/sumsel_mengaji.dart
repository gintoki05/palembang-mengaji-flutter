import 'package:flutter/material.dart';

import '../pages/kajian_details.dart';

class KajianSumsel extends StatefulWidget {
  @override
  _KajianSumselState createState() => _KajianSumselState();
}

class _KajianSumselState extends State<KajianSumsel> {
  List<Container> daftarKajian = List();

  var kajian = [
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
    for (var i = 0; i < kajian.length; i++) {
      final kajiannya = kajian[i];
      final String gambar = kajiannya["gambar"];

      daftarKajian.add(
        Container(
          padding: EdgeInsets.all(10.0),
          child: Card(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  child: Material(
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => KajianDetail(
                                  nama: kajiannya['nama'],
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
                      kajiannya['nama'],
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
      children: daftarKajian,
    );
  }
}
