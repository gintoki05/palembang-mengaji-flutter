import 'package:flutter/material.dart';

import './tabs/jadwal.dart';
import './tabs/info.dart';
import './tabs/lokasi.dart';

import './fragments/sumsel_mengaji.dart';
import './fragments/sumsel_ponpes.dart';
import './fragments/jadwal_lengkap.dart';
import './fragments/loker.dart';
import './fragments/tentang.dart';

const API_KEY = "AIzaSyB4Lzd6JAQbbKG3EESAXuVU_K7u39wvBqU";

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'Palembang Mengaji',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                            fontFamily: 'Roboto'),
                      )),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "http://palembangmengaji.forkismapalembang.com/gambar/kajian.jpg"),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.white,
                  ),
                ),
                ListTile(
                  title: Text('Sumsel Mengaji'),
                  leading: Icon(Icons.dashboard),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => SumselMengaji()),
                    );
                  },
                ),
                ListTile(
                  title: Text('Sumsel Ponpes'),
                  leading: Icon(Icons.account_balance),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => SumselPonpes()),
                    );
                  },
                ),
                ListTile(
                  title: Text('Jadwal Lengkap'),
                  leading: Icon(Icons.view_list),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => JadwalLengkap()),
                    );
                  },
                ),
                // ListTile(
                //   title: Text('Loker'),
                //   leading: Icon(Icons.business),
                //   onTap: () {
                //     Navigator.pop(context);
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (BuildContext context) => Loker()),
                //     );
                //   },
                // ),
                ListTile(
                  title: Text('Tentang'),
                  leading: Icon(Icons.touch_app),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Tentang()),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
