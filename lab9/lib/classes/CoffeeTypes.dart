enum CoffeeType { espr, cap, lat }

Map<CoffeeType, List<int>> coffeeResources = {
  CoffeeType.espr: [50, 0, 100],
  CoffeeType.cap: [50, 50, 100],
  CoffeeType.lat: [50, 100, 150],
};

Map<CoffeeType, String> coffeeTypeToName = {
  CoffeeType.espr: 'Эспрессо',
  CoffeeType.cap: 'Капучино',
  CoffeeType.lat: 'Латте',
};

