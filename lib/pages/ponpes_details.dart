import 'package:flutter/material.dart';

class PonpesDetail extends StatelessWidget {
  final String nama;

  PonpesDetail({this.nama});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nama),
      ),
    );
  }
}
