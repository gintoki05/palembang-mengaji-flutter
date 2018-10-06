import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../models/hari.dart';
import '../api/list_jadwal.dart';

Widget imageJadwalSection = CachedNetworkImage(
  imageUrl:
      'http://palembangmengaji.forkismapalembang.com/gambar/hari/senin.png',
  width: 600.0,
  height: 240.0,
  fit: BoxFit.cover,
);

Widget listJadwalSection = new FutureBuilder<List<Hari>>(
    future: fetchJadwalFromAPI(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return new ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return new Card(
                  child: new Row(children: <Widget>[
                new Column(
                  children: <Widget>[new Text('Masjid :')],
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      snapshot.data[index].masjid,
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ]));
            });
      } else if (snapshot.hasError) {
        return new Text("${snapshot.error}");
      }

// By default, show a loading spinner
      return new CircularProgressIndicator();
    },

);

Widget hariDetailSection = new CustomScrollView(
  slivers: <Widget>[
    const SliverAppBar(
      pinned: true,
      expandedHeight: 250.0,
      flexibleSpace: const FlexibleSpaceBar(
        title: const Text('judul'),
      ),
    ),
    new SliverFixedExtentList(
      itemExtent: 50.0,
      delegate: new SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          return new Container(
            alignment: Alignment.center,
            color: Colors.lightBlue[100 * (index % 9)],
            child: new Text('list item $index'),
          );
        },
      ),
    ),
  ],
);