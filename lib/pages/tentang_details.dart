import 'package:flutter/material.dart';
import 'package:share/share.dart';

class TentangDetail extends StatelessWidget {
  final String text =
      'https://play.google.com/store/apps/details?id=com.mitkonsultan.palembangmengaji';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.all(20.0),
              child: Image.asset(
                'assets/logobar.png',
                fit: BoxFit.cover,
                width: 60.0,
              ),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Palembang Mengaji',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.shade800,
                        radius: 15.0,
                        child: Text(
                          'v2.2.2',
                          style: TextStyle(fontSize: 10.0, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 0.0),
                  child: Text('Aplikasi Jadwal Kajian Palembang dan Sekitarnya',
                      style: TextStyle(fontSize: 10.0)),
                )
              ],
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              child: Text(
                'Dikembangkan Oleh :',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: Colors.grey),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              child: Text(
                'MIT Konsultan Palembang',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              child: Text(
                'Website : mitkonsultan.com',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              child: Text(
                'Email : mitkonsultanpalembang@gmail.com',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child: Text(
                'Didukung Oleh :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                  child: Image.asset(
                    'assets/logoforkisma.jpg',
                    width: 60.0,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                  child: Image.asset(
                    'assets/info.jpg',
                    width: 60.0,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(30.0),
              child: FlatButton(
                onPressed: text.isEmpty
                    ? null
                    : () {
                        // A builder is used to retrieve the context immediately
                        // surrounding the RaisedButton.
                        //
                        // The context's `findRenderObject` returns the first
                        // RenderObject in its descendent tree when it's not
                        // a RenderObjectWidget. The RaisedButton's RenderObject
                        // has its position and size after it's built.
                        final RenderBox box = context.findRenderObject();
                        Share.share(text,
                            sharePositionOrigin:
                                box.localToGlobal(Offset.zero) & box.size);
                      },
                color: Colors.lightBlue[600],
                padding: EdgeInsets.all(10.0),
                child: Column(
                  // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                    Text(
                      "Bagikan Aplikasi Ini",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
