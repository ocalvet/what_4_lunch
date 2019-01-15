import 'package:flutter_test/flutter_test.dart';
import 'package:what_4_lunch/weather.dart';
import 'package:what_4_lunch/weatherService.dart';

void main() {
  test('mapPlace should convert a json string into a Weather model', () {
    String weatherJsonString = """{"coord":{"lon":-80.1,"lat":26.35},"weather":[{"id":711,"main":"Smoke","description":"smoke","icon":"50d"}],"base":"stations","main":{"temp":58.73,"pressure":1022,"humidity":69,"temp_min":57.56,"temp_max":60.08},"visibility":16093,"wind":{"speed":11.41,"deg":330},"clouds":{"all":1},"dt":1547561700,"sys":{"type":1,"id":4735,"message":0.004,"country":"US","sunrise":1547554184,"sunset":1547592627},"id":420008716,"name":"Boca Raton","cod":200}""";
    Weather weatherData = weatherService.mapWeather(weatherJsonString);
    expect(weatherData.name, equals("Boca Raton"));
  }); 
}