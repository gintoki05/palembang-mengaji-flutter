import 'package:flutter/material.dart';

import '../maps/lokasi_detail.dart';

class LokasiPage extends StatefulWidget {
  @override
  _LokasiPageState createState() => _LokasiPageState();
}

class _LokasiPageState extends State<LokasiPage> {
  List<Container> daftarMasjid = List();

  var masjid = [
    {
      "nama": "Masjid Bakti",
      "gambar":
          "http://palembangmengaji.forkismapalembang.com/gambar/kajian.jpg",
      "lat": -2.939352,
      "lng": 104.729342
    },
    {
      "nama": "Masjid Imam Syafii",
      "gambar":
          "http://palembangmengaji.forkismapalembang.com/gambar/kajian.jpg",
      "lat": -2.939352,
      "lng": 104.729342
    },
    {
      "nama": "Masjid Bakti",
      "gambar":
          "http://palembangmengaji.forkismapalembang.com/gambar/kajian.jpg",
      "lat": -2.939352,
      "lng": 104.729342
    },
    {
      "nama": "Masjid Bakti",
      "gambar":
          "http://palembangmengaji.forkismapalembang.com/gambar/kajian.jpg",
      "lat": -2.939352,
      "lng": 104.729342
    },
    {
      "nama": "Masjid Bakti",
      "gambar":
          "http://palembangmengaji.forkismapalembang.com/gambar/kajian.jpg",
      "lat": -2.939352,
      "lng": 104.729342
    },
    {
      "nama": "Masjid Bakti",
      "gambar":
          "http://palembangmengaji.forkismapalembang.com/gambar/kajian.jpg",
      "lat": -2.939352,
      "lng": 104.729342
    },
  ];

  _buatlist() async {
    for (var i = 0; i < masjid.length; i++) {
      final masjidnya = masjid[i];
      final String gambar = masjidnya["gambar"];

      daftarMasjid.add(
        Container(
          padding: EdgeInsets.all(10.0),
          child: Card(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  child: Material(
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => LokasiDetail(
                                nama: masjidnya['nama'],
                                lat: masjidnya['lat'],
                                lng: masjidnya['lng']),
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
                      masjidnya['nama'],
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
      children: daftarMasjid,
    );
  }
}
