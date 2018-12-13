import 'package:flutter/material.dart';

import '../main.dart';
import '../widget/sumsel_mengaji.dart';
import './sumsel_ponpes.dart';
import './jadwal_lengkap.dart';
import './loker.dart';
import './tentang.dart';

class SumselMengaji extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    image: new NetworkImage(
                        "http://palembangmengaji.forkismapalembang.com/gambar/kajian.jpg"),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: Text('Home'),
                leading: Icon(Icons.home),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => HomeScreen()),
                  );
                },
              ),
              ListTile(
                title: Text('Sumsel Ponpes'),
                leading: Icon(Icons.account_balance),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
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
                  Navigator.pushReplacement(
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
              //     Navigator.pushReplacement(
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Tentang()),
                  );
                },
              ),
            ],
          ),
        ),
        appBar: new AppBar(
          title: new Text("Sumsel Mengaji"),
        ),
        body: KajianSumsel());
  }
}
