import 'package:flutter/material.dart';

class KajianSumsel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this would produce 2 rows.
      crossAxisCount: 2,
      // Generate 100 Widgets that display their index in the List
      children: new List<Widget>.generate(16, (index) {
        return new GridTile(
            child: new Card(
                color: Colors.blue.shade200,
                child: new Center(
                  child: new Text('tile $index'),
                )));
      }),
    ));
  }
}
