import 'Machine.dart'; // Добавьте этот импорт
import 'CoffeeTypes.dart';

void orderCoffee(Machine machine, CoffeeType type) {
  List<int> resources = coffeeResources[type]!;

  if (machine.isAvailable(resources[0], resources[1], resources[2])) {
    machine.makingCoffee(type);
  } else {
    print('Недостаточно ресурсов для приготовления ${coffeeTypeToName[type]}.');
  }
}