import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
  _startCoffeePreparation();
}

Future<void> _startCoffeePreparation() async {
  print('\n=== Начало приготовления кофе ===');
  

  await _heatWater();
  
  
  await Future.wait([
    _brewCoffee(),
    _frothMilk(),
  ]);
  
  
  await _mixIngredients();
  
  print('=== Ваш кофе готов! Наслаждайтесь! ===\n');
}


Future<void> _heatWater() async {
  print('Начинаем нагрев воды...');
  await Future.delayed(Duration(seconds: 3));
  print('Вода нагрета до нужной температуры!');
}


Future<void> _brewCoffee() async {
  print('Начинаем заваривание кофе...');
  await Future.delayed(Duration(seconds: 5));
  print('Кофе успешно заварен!');
}


Future<void> _frothMilk() async {
  print('Начинаем взбивание молока...');
  await Future.delayed(Duration(seconds: 5));
  print('Молоко взбито до идеальной пенки!');
}


Future<void> _mixIngredients() async {
  print('Начинаем смешивание кофе и молока...');
  await Future.delayed(Duration(seconds: 3));
  print('Ингредиенты идеально смешаны!');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Кофе Машина')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 20),
              Text('Готовим ваш кофе...',
                  style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}