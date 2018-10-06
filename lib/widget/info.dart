import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../models/info.dart';
import '../api/info.dart';
import '../pages/info_details.dart';

void _navigateToInfoPage(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute<Null>(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: new Text('Info'),
        ),
        body: InfoDetails(),
      );
    },
  ));
}

Widget listInfoSection = Center(
  child: new FutureBuilder<List<Info>>(
    future: fetchInfoFromAPI(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return new ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return new GestureDetector(
                onTap: () => _navigateToInfoPage(context),
                child: new Card(
                  child: new Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 5.0),
                              child: Text(snapshot.data[index].judul,
                                  overflow: TextOverflow.ellipsis,
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0)),
                            ),
                            Container(
                                padding:
                                    EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 15.0),
                                child: Text(
                                  snapshot.data[index].deskripsi,
                                  style: new TextStyle(fontFamily: 'Georgia'),
                                  overflow: TextOverflow.ellipsis,
                                )),
                            Container(
                              padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                              child: Text(
                                snapshot.data[index].tanggal,
                                style: new TextStyle(fontSize: 10.0),
                              ),
                              alignment: Alignment.bottomLeft,
                            ),
                          ],
                        ),
                      ),
                      CachedNetworkImage(
                        imageUrl: snapshot.data[index].foto,
                        width: 80.0,
                        height: 80.0,
                      ),
                    ],
                  ),
                ),
              );
            });
      } else if (snapshot.hasError) {
        return new Text("${snapshot.error}");
      }

      // By default, show a loading spinner
      return new CircularProgressIndicator();
    },
  ),
);

Widget infoSection = listInfoSection;
