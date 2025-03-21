import 'package:flutter/material.dart';

class InfinityList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: null, 
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Строка №$index'),
        );
      },
    );
  }
}