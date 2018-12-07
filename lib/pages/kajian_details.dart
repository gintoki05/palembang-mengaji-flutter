import 'package:flutter/material.dart';

class KajianDetail extends StatelessWidget {
  final String nama;

  KajianDetail({this.nama});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nama),
      ),
    );
  }
}
