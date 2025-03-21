import 'package:flutter/material.dart';

class InfinityMathList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: null, 
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('2^$index = ${1 << index}'),
        );
      },
    );
  }
}