import 'classes/Machine.dart';
import 'classes/CoffeeTypes.dart';
import 'classes/UserInterface.dart';

void main() {
  Machine coffeeMachine = Machine(500, 500, 1000, 0);

  orderCoffee(coffeeMachine, CoffeeType.espr);
  orderCoffee(coffeeMachine, CoffeeType.cap);
  orderCoffee(coffeeMachine, CoffeeType.lat);
}