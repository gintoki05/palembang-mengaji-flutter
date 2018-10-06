import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../models/info.dart';
import '../api/info.dart';

Widget listInfoSection = Center(
  child: new FutureBuilder<List<Info>>(
    future: fetchInfoFromAPI(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return new ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return new Row(
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl: snapshot.data[index].foto,
                    width: 80.0,
                    height: 80.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            snapshot.data[index].judul,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              snapshot.data[index].deskripsi,
                              overflow: TextOverflow.ellipsis,
                            )),
                        Container(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              snapshot.data[index].tanggal,
                            ))
                      ],
                    ),
                  ),
                  new Divider()
                ],
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
