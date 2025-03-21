import 'package:flutter/material.dart';

class SimpleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(title: Text('0000')),
        ListTile(title: Text('0001')),
        ListTile(title: Text('0010')),
      ],
    );
  }
}