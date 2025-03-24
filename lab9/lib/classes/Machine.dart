import 'CoffeeTypes.dart'; // Добавьте этот импорт

class Machine {
  int _coffeeBeans;
  int _milk;
  int _water;
  int _cash;

  Machine(this._coffeeBeans, this._milk, this._water, this._cash);

  int get coffeeBeans => _coffeeBeans;
  set coffeeBeans(int value) => _coffeeBeans = value;

  int get milk => _milk;
  set milk(int value) => _milk = value;

  int get water => _water;
  set water(int value) => _water = value;

  int get cash => _cash;
  set cash(int value) => _cash = value;

  bool isAvailable(int beansRequired, int milkRequired, int waterRequired) {
    return _coffeeBeans >= beansRequired &&
        _milk >= milkRequired &&
        _water >= waterRequired;
  }

  void _subtractResources(int beansRequired, int milkRequired, int waterRequired) {
    _coffeeBeans -= beansRequired;
    _milk -= milkRequired;
    _water -= waterRequired;
  }

  void makingCoffee(CoffeeType type) {
    List<int> resources = coffeeResources[type]!;
    String typeName = coffeeTypeToName[type]!; // Получаем русское название кофе

    if (isAvailable(resources[0], resources[1], resources[2])) {
      _subtractResources(resources[0], resources[1], resources[2]);
      _cash += getPrice(type); // Увеличиваем деньги за проданный кофе
      print('$typeName готов!');
    } else {
      print('Недостаточно ресурсов.');
    }
  }

  int getPrice(CoffeeType type) {
    switch (type) {
      case CoffeeType.espr:
        return 100;
      case CoffeeType.cap:
        return 150;
      case CoffeeType.lat:
        return 200;
      default:
        return 0;
    }
  }
}