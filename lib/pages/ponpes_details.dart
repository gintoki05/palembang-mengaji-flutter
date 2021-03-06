import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_html_view/flutter_html_view.dart';

class PonpesDetail extends StatefulWidget {
  final String foto;
  final String judul;
  final String deskripsi;
  final String lokasi;
  final double lat;
  final double lng;

  PonpesDetail(
      {this.foto, this.judul, this.deskripsi, this.lokasi, this.lat, this.lng});

  @override
  State createState() => PonpesDetailState();
}

class PonpesDetailState extends State<PonpesDetail> {
  GoogleMapController mapController;
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
            height: 250.0,
            width: double.infinity,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              options: GoogleMapOptions(
                cameraPosition: CameraPosition(
                    target: LatLng(widget.lat, widget.lng), zoom: 13.0),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    widget.judul,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                FloatingActionButton.extended(
                  icon: Icon(
                    Icons.place,
                  ),
                  label: Text('Tap'),
                  onPressed: mapController == null
                      ? null
                      : () {
                          mapController.animateCamera(
                            CameraUpdate.newCameraPosition(
                              CameraPosition(
                                // bearing: 270.0,
                                target: LatLng(widget.lat, widget.lng),
                                tilt: 30.0,
                                zoom: 17.0,
                              ),
                            ),
                          );
                          mapController.addMarker(
                            MarkerOptions(
                              position: LatLng(widget.lat, widget.lng),
                              infoWindowText: InfoWindowText(widget.judul,
                                  "Klik ikon map di sudut kanan bawah"),
                            ),
                          );
                        },
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
            margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: HtmlView(data: widget.deskripsi),
          ),
          // RaisedButton(
          //   onPressed: _showPersBottomSheetCallBack,
          // )
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }
}
