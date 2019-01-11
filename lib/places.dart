import 'package:what_4_lunch/place.dart';
import 'dart:math';

class Places {
  final List<Place> _places = [
    Place(name: 'PeiWei'),
    Place(name: "Shane's"),
    Place(name: 'Chipotle'),
    Place(name: 'The Habit'),
    Place(name: 'Senor Burrito'),
    Place(name: 'Jamaican'),
    Place(name: 'Cuban'),
    Place(name: "Santo's"),
    Place(name: '5 Spice'),
    Place(name: 'Punjab'),
    Place(name: 'WholeFoods'),
  ];
  
  final _random = new Random();

  getRandomPlace() {
    return _places[_random.nextInt(_places.length)];
  }
}

final places = Places();
