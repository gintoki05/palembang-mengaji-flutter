import 'package:flutter/material.dart';

class HariDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/senin.png',
        ),
        Container(padding: EdgeInsets.all(10.0), child: Text('Detail'))
      ],
    ));
  }
}
