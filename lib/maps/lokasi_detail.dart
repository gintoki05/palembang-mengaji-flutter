import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class LokasiDetail extends StatelessWidget {
  LokasiDetail({this.nama, this.lat, this.lng});
  final String nama;
  final double lat;
  final double lng;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nama),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(lat, lng),
          zoom: 13.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://api.tiles.mapbox.com/v4/"
                "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
            additionalOptions: {
              'accessToken':
                  'pk.eyJ1IjoiYWppZXByYXN0eW8iLCJhIjoiY2puYmQzaWxhNWNkaDNrbjE0MXQ3aGpibCJ9.-BARTaMK_RcbSwEh9uwk7Q',
              'id': 'mapbox.streets',
            },
          ),
          MarkerLayerOptions(markers: [
            Marker(
                width: 45.0,
                height: 45.0,
                point: LatLng(lat, lng),
                builder: (context) => Container(
                      child: IconButton(
                        icon: Icon(Icons.location_on),
                        color: Colors.blue,
                        iconSize: 45.0,
                        onPressed: () {
                          print('Marker tapped');
                        },
                      ),
                    ))
          ])
        ],
      ),
    );
  }
}
