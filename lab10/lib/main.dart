import 'package:flutter/material.dart';

void main() => runApp(CoffeeApp());

class CoffeeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Кофемашина',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          headline6: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pink[800]),
          bodyText1: TextStyle(fontSize: 16, color: Colors.pink[700]),
          bodyText2: TextStyle(fontSize: 14, color: Colors.pink[600]),
        ),
      ),
      home: CoffeeHomePage(),
    );
  }
}

class CoffeeHomePage extends StatefulWidget {
  @override
  _CoffeeHomePageState createState() => _CoffeeHomePageState();
}

class _CoffeeHomePageState extends State<CoffeeHomePage> {
  final Machine coffeeMachine = Machine();

  void _makeCoffee() {
    final coffee = Espresso();
    final success = coffeeMachine.makeCoffee(coffee);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        title: Text(success ? 'Готово' : 'Ошибка', style: TextStyle(color: Colors.pink[800])),
        content: Text(success ? 'Ваш ${coffee.name} готов!' : 'Недостаточно ресурсов!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK', style: TextStyle(color: Colors.pink)),
          ),
        ],
      ),
    );
    setState(() {});
  }

  void _showRefillDialog(String resourceName, Function(int) onAdd) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        title: Text('Пополнить $resourceName', style: TextStyle(color: Colors.pink[800])),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Введите количество',
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.pink)),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              final value = int.tryParse(controller.text) ?? 0;
              if (value > 0) onAdd(value);
              setState(() {});
              Navigator.pop(context);
            },
            child: Text('OK', style: TextStyle(color: Colors.pink)),
          ),
        ],
      ),
    );
  }

  void _collectCash() {
    final collected = coffeeMachine.cash;
    coffeeMachine.collectCash();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        title: Text('Инкассация', style: TextStyle(color: Colors.pink[800])),
        content: Text('Вы забрали $collected руб.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK', style: TextStyle(color: Colors.pink)),
          ),
        ],
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Кофемашина', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.pink[600],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Ресурсы:', style: Theme.of(context).textTheme.headline6),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.pink[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.pink[100]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Кофейные зерна: ${coffeeMachine.coffeeBeans} гр', 
                      style: Theme.of(context).textTheme.bodyText1),
                  SizedBox(height: 8),
                  Text('Молоко: ${coffeeMachine.milk} мл', 
                      style: Theme.of(context).textTheme.bodyText1),
                  SizedBox(height: 8),
                  Text('Вода: ${coffeeMachine.water} мл', 
                      style: Theme.of(context).textTheme.bodyText1),
                  SizedBox(height: 8),
                  Text('Деньги в машине: ${coffeeMachine.cash} руб', 
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.pink[400],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: _makeCoffee,
              child: Text('Приготовить Эспрессо (50 руб)', 
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.pink[400],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () => _showRefillDialog('кофейные зерна', coffeeMachine.addCoffeeBeans),
              child: Text('Пополнить зерна', 
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.pink[400],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () => _showRefillDialog('молоко', coffeeMachine.addMilk),
              child: Text('Пополнить молоко', 
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.pink[400],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () => _showRefillDialog('воду', coffeeMachine.addWater),
              child: Text('Пополнить воду', 
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.pink[400],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: _collectCash,
              child: Text('Забрать деньги', 
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      ),
    );
  }
}

class Machine {
  static final Machine _instance = Machine._internal();
  factory Machine() => _instance;
  Machine._internal();

  int _coffeeBeans = 500;
  int _milk = 1000;
  int _water = 2000;
  int _cash = 0;

  int get coffeeBeans => _coffeeBeans;
  int get milk => _milk;
  int get water => _water;
  int get cash => _cash;

  bool isAvailable(ICoffee coffee) =>
      _coffeeBeans >= coffee.beansNeeded &&
      _milk >= coffee.milkNeeded &&
      _water >= coffee.waterNeeded;

  bool makeCoffee(ICoffee coffee) {
    if (!isAvailable(coffee)) return false;
    _coffeeBeans -= coffee.beansNeeded;
    _milk -= coffee.milkNeeded;
    _water -= coffee.waterNeeded;
    _cash += coffee.price;
    return true;
  }

  void addCoffeeBeans(int amount) => _coffeeBeans += amount;
  void addMilk(int amount) => _milk += amount;
  void addWater(int amount) => _water += amount;
  void collectCash() => _cash = 0;
}

abstract class ICoffee {
  int get beansNeeded;
  int get waterNeeded;
  int get milkNeeded;
  int get price;
  String get name;
}

class Espresso implements ICoffee {
  @override
  int get beansNeeded => 50;
  @override
  int get waterNeeded => 100;
  @override
  int get milkNeeded => 0;
  @override
  int get price => 50;
  @override
  String get name => 'Эспрессо';
}