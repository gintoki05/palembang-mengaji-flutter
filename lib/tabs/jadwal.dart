import 'package:flutter/material.dart';

import '../widget/jadwal_card.dart';

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

  static const _url = <String>[
    "http://palembangmengaji.forkismapalembang.com/gambar/hari/senin.png",
    "http://palembangmengaji.forkismapalembang.com/gambar/hari/selasa.png",
    "http://palembangmengaji.forkismapalembang.com/gambar/hari/rabu.png",
    "http://palembangmengaji.forkismapalembang.com/gambar/hari/kamis.png",
    "http://palembangmengaji.forkismapalembang.com/gambar/hari/jumat.png",
    "http://palembangmengaji.forkismapalembang.com/gambar/hari/sabtu.png",
    "http://palembangmengaji.forkismapalembang.com/gambar/hari/ahad.png"
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

  static const _hari = <String>[
    'http://palembangmengaji.forkismapalembang.com/api.php?hari=senin',
    'http://palembangmengaji.forkismapalembang.com/api.php?hari=selasa',
    'http://palembangmengaji.forkismapalembang.com/api.php?hari=rabu',
    'http://palembangmengaji.forkismapalembang.com/api.php?hari=kamis',
    'http://palembangmengaji.forkismapalembang.com/api.php?hari=jumat',
    'http://palembangmengaji.forkismapalembang.com/api.php?hari=sabtu',
    'http://palembangmengaji.forkismapalembang.com/api.php?hari=ahad',
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
        url: _url[i],
        hari: _hari[i],
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
