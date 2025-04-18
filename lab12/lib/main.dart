import 'package:flutter/material.dart';
import 'coffee_maker_screen.dart';

void main() {
  runApp(const CoffeeMakerApp());
}

class CoffeeMakerApp extends StatelessWidget {
  const CoffeeMakerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Кофемашина',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Colors.purple[200]!,
          secondary: Colors.pink[300]!,
        ),
        useMaterial3: true,
      ),
      home: const CoffeeMakerScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}