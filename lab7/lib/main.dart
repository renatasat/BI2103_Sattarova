import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Главное окно'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen()),
            );

            if (result != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$result')),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lime, 
            foregroundColor: Colors.black, 
          ),
          child: Text('Открыть второе окно'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Второе окно'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'Да');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lime, 
                foregroundColor: Colors.black, 
              ),
              child: Text('Да'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Нет')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lime, 
                foregroundColor: Colors.black, 
              ),
              child: Text('Нет'),
            ),
          ],
        ),
      ),
    );
  }
}