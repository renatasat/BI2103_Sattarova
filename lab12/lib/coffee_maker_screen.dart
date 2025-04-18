import 'package:flutter/material.dart';
import 'coffee_maker_service.dart';
import 'models.dart';

class CoffeeMakerScreen extends StatefulWidget {
  const CoffeeMakerScreen({super.key});

  @override
  State<CoffeeMakerScreen> createState() => _CoffeeMakerScreenState();
}

class _CoffeeMakerScreenState extends State<CoffeeMakerScreen> {
  late CoffeeMakerService coffeeMaker;

  @override
  void initState() {
    super.initState();
    coffeeMaker = CoffeeMakerService(resources: CoffeeResources());
  }

  void _showResult(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Кофемашина'),
        backgroundColor: Colors.purple[200],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.pink[100]!,
              const Color(0xFFFFDAB9), // Персиковый цвет
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Card(
                color: Colors.lightGreenAccent[100],
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Ваш баланс: ${coffeeMaker.userBalance} руб.',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              
              
              Card(
                color: Colors.purple[50],
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Ресурсы:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text('Молоко: ${coffeeMaker.resources.milk} мл'),
                      Text('Вода: ${coffeeMaker.resources.water} мл'),
                      Text('Кофейные зерна: ${coffeeMaker.resources.beans} г'),
                      Text('Касса: ${coffeeMaker.resources.cash} руб.'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              
              
              const Text(
                'Выберите кофе:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Wrap(
                spacing: 8.0,
                children: coffeeMaker.coffeeRecipes.map((recipe) {
                  return ElevatedButton(
                    onPressed: () {
                      final result = coffeeMaker.makeCoffee(recipe.name);
                      setState(() {});
                      _showResult(result);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple[200],
                    ),
                    child: Text(
                      '${recipe.name} (${recipe.price} руб.)',
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              
              
              const Text(
                'Пополнить баланс:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Wrap(
                spacing: 8.0,
                children: coffeeMaker.moneyOptions.map((amount) {
                  return ElevatedButton(
                    onPressed: () {
                      final result = coffeeMaker.addMoney(amount);
                      setState(() {});
                      _showResult(result);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[300],
                    ),
                    child: Text(
                      '$amount руб.',
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              
              
              const Text(
                'Обслуживание:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      final result = coffeeMaker.refillResources();
                      setState(() {});
                      _showResult(result);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[300],
                    ),
                    child: const Text('Пополнить ресурсы'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      final result = coffeeMaker.collectCash();
                      setState(() {});
                      _showResult(result);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.tealAccent[400],
                    ),
                    child: const Text('Собрать деньги'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}