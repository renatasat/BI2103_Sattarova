import 'package:flutter/material.dart';
import 'simple_list.dart';
import 'infinity_list.dart';
import 'infinity_math_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Список элементов',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.list), text: 'Simple List'),
                Tab(icon: Icon(Icons.all_inclusive), text: 'Infinity List'),
                Tab(icon: Icon(Icons.calculate), text: 'Infinity Math List'),
              ],
            ),
            title: Text('Список элементов'),
          ),
          body: TabBarView(
            children: [
              SimpleList(),
              InfinityList(),
              InfinityMathList(),
            ],
          ),
        ),
      ),
    );
  }
}