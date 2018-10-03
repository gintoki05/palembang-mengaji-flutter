import 'package:flutter/material.dart';

import '../widget/jadwal_card.dart';

import '../models/hari.dart';

class JadwalPage extends StatelessWidget {
  const JadwalPage();

  static const _gambar = <String>[
    'assets/seninlist.png',
    'assets/selasalist.png',
    'assets/rabulist.png',
    'assets/kamislist.png',
    'assets/jumatlist.png',
    'assets/sabtulist.png',
    'assets/ahadlist.png',
  ];

  static const _judul = <String>[
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu',
    'Ahad'
  ];


  Widget _buildJadwalWidget(List<Widget> jadwals) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => jadwals[index],
      itemCount: jadwals.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    final jadwals = <JadwalList>[];

    for (var i = 0; i < _gambar.length; i++) {
      jadwals.add(JadwalList(
        gambar: _gambar[i],
        judul: _judul[i],
      ));
    }

    final listView = Container(
      child: _buildJadwalWidget(jadwals),
    );

    return Scaffold(
      body: listView,
    );
  }
}
