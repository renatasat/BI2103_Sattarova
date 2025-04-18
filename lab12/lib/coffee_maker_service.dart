import 'models.dart';

class CoffeeMakerService {
  CoffeeResources resources;
  int userBalance = 0;
  
  final List<CoffeeRecipe> coffeeRecipes = [
    CoffeeRecipe(
      name: 'Эспрессо',
      water: 50,
      milk: 0,
      beans: 18,
      price: 150,
    ),
    CoffeeRecipe(
      name: 'Капучино',
      water: 200,
      milk: 100,
      beans: 24,
      price: 250,
    ),
  ];

  final List<int> moneyOptions = [100, 200, 300, 400, 500];

  CoffeeMakerService({required this.resources});

  String makeCoffee(String coffeeType) {
    final recipe = coffeeRecipes.firstWhere(
      (r) => r.name.toLowerCase() == coffeeType.toLowerCase(),
      orElse: () => throw Exception('Неизвестный тип кофе'),
    );

    if (userBalance < recipe.price) {
      return 'Недостаточно средств. Нужно: ${recipe.price} руб.';
    }

    if (resources.water < recipe.water ||
        resources.milk < recipe.milk ||
        resources.beans < recipe.beans) {
      return 'Недостаточно ингредиентов';
    }

    resources.water -= recipe.water;
    resources.milk -= recipe.milk;
    resources.beans -= recipe.beans;
    userBalance -= recipe.price;
    resources.cash += recipe.price;

    return 'Ваш $coffeeType готов!';
  }

  String addMoney(int amount) {
    userBalance += amount;
    return 'Баланс пополнен на $amount руб.';
  }

  String refillResources() {
    resources.water = 250;
    resources.milk = 250;
    resources.beans = 250;
    return 'Ресурсы пополнены';
  }

  String collectCash() {
    final collected = resources.cash;
    resources.cash = 0;
    return 'Собрано $collected руб.';
  }
}