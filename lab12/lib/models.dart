class CoffeeRecipe {
  final String name;
  final int water;
  final int milk;
  final int beans;
  final int price;

  CoffeeRecipe({
    required this.name,
    required this.water,
    required this.milk,
    required this.beans,
    required this.price,
  });
}

class CoffeeResources {
  int milk;
  int water;
  int beans;
  int cash;

  CoffeeResources({
    this.milk = 250,
    this.water = 250,
    this.beans = 250,
    this.cash = 0,
  });
}