import 'package:flutter/material.dart';

import './tabs/jadwal.dart';
import './tabs/info.dart';
import './tabs/lokasi.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                title: Text('Palembang Mengaji'),
                bottom: TabBar(
                  tabs: <Widget>[
                    Tab(text: 'Jadwal'),
                    Tab(text: 'Info'),
                    Tab(text: 'Lokasi'),
                  ],
                ),
              ),
              body: TabBarView(
                children: <Widget>[JadwalPage(), InfoPage(), LokasiPage()],
              ),
            )));
  }
}