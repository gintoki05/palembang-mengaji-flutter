import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_view.dart';

class PonpesDetail extends StatefulWidget {
  final String foto;
  final String judul;
  final String jadwal;
  final String lokasi;

  PonpesDetail({this.foto, this.judul, this.jadwal, this.lokasi});

  @override
  State createState() => PonpesDetailState();
}

class PonpesDetailState extends State<PonpesDetail> {
  // final _scaffoldKey = new GlobalKey<ScaffoldState>();
  // VoidCallback _showPersBottomSheetCallBack;

  // @override
  // void initState() {
  //   super.initState();
  //   _showPersBottomSheetCallBack = _showBottomSheet;
  // }

  // void _showBottomSheet() {
  //   setState(() {
  //     _showPersBottomSheetCallBack = null;
  //   });

  //   _scaffoldKey.currentState
  //       .showBottomSheet((context) {
  //         return new Container(
  //           height: 300.0,
  //           color: Colors.greenAccent,
  //           child: new Center(
  //             child: new Text("Hi BottomSheet"),
  //           ),
  //         );
  //       })
  //       .closed
  //       .whenComplete(() {
  //         if (mounted) {
  //           setState(() {
  //             _showPersBottomSheetCallBack = _showBottomSheet;
  //           });
  //         }
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.judul),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Image.network(widget.foto, fit: BoxFit.cover),
            height: 240.0,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 20.0, 0.0, 0.0),
                  child: Text(
                    widget.judul,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.all(10.0),
            child: Text(widget.lokasi),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: HtmlView(data: widget.jadwal),
          )
          // RaisedButton(
          //   onPressed: _showPersBottomSheetCallBack,
          // )
        ],
      ),
    );
  }
}
