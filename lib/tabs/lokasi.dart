import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../maps/lokasi_detail.dart';

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response = await client
      .get('http://palembangmengaji.forkismapalembang.com/lokasimasjid.php');

  // Use the compute function to run parsePhotos in a separate isolate
  return compute(parsePhotos, response.body);
}

// A function that will convert a response body into a List<Photo>
List<Photo> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

class Photo {
  final String foto;
  final String judul;
  final String jadwal;
  final String lokasi;
  final double lat;
  final double lng;

  Photo({this.foto, this.judul, this.jadwal, this.lokasi, this.lat, this.lng});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      foto: json['foto'] as String,
      judul: json['judul'] as String,
      jadwal: json['jadwal'] as String,
      lokasi: json['lokasi'] as String,
      lat: json['lat'] as double,
      lng: json['lng'] as double,
    );
  }
}

class LokasiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Photo>>(
      future: fetchPhotos(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? PhotosList(photos: snapshot.data)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}

class PhotosList extends StatelessWidget {
  final List<Photo> photos;

  PhotosList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(10.0),
          child: Card(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  child: Material(
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => LokasiDetail(
                                judul: photos[index].judul,
                                jadwal: photos[index].jadwal,
                                foto: photos[index].foto,
                                lokasi: photos[index].lokasi,
                                lat: photos[index].lat,
                                lng: photos[index].lng),
                          )),
                      child: Image.network(
                        photos[index].foto,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0)),
                Container(
                    child: Text(
                      photos[index].judul,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 13.0),
                    ),
                    alignment: Alignment.center)
              ],
            ),
          ),
        );
      },
    );
  }
}
