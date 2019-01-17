import 'package:flutter_test/flutter_test.dart';
import 'package:what_4_lunch/models/weather.dart';
import 'package:what_4_lunch/api/weather_service.dart';

void main() {
  test('mapWeather should convert a json string into a Weather model', () {
    WeatherService weatherService = WeatherService();
    String weatherJsonString = """{"coord":{"lon":-80.1,"lat":26.35},"weather":[{"id":711,"main":"Smoke","description":"smoke","icon":"50d"}],"base":"stations","main":{"temp":58.73,"pressure":1022,"humidity":69,"temp_min":57.56,"temp_max":60.08},"visibility":16093,"wind":{"speed":11.41,"deg":330},"clouds":{"all":1},"dt":1547561700,"sys":{"type":1,"id":4735,"message":0.0045,"country":"US","sunrise":1547554184,"sunset":1547592627},"id":420008716,"name":"Boca Raton","cod":200}""";
    Weather weatherData = weatherService.mapWeather(weatherJsonString);
    expect(weatherData.name, equals("Boca Raton"));
    expect(weatherData.coord.lat, equals(26.35));
    expect(weatherData.coord.lon, equals(-80.1));
    expect(weatherData.weather, hasLength(1));
    expect(weatherData.weather[0].id, equals(711));
    expect(weatherData.weather[0].main, equals("Smoke"));
    expect(weatherData.weather[0].description, equals("smoke"));
    expect(weatherData.weather[0].icon, equals("50d"));
    expect(weatherData.base, equals("stations"));
    expect(weatherData.main.temp, equals(58.73));
    expect(weatherData.main.pressure, equals(1022));
    expect(weatherData.main.humidity, equals(69));
    expect(weatherData.main.tempMin, equals(57.56));
    expect(weatherData.main.tempMax, equals(60.08));
    expect(weatherData.visibility, equals(16093));
    expect(weatherData.wind.speed, equals(11.41));
    expect(weatherData.wind.deg, equals(330));
    expect(weatherData.clouds.all, equals(1));
    expect(weatherData.dt, equals(1547561700));
    expect(weatherData.sys.type, equals(1));
    expect(weatherData.sys.id, equals(4735));
    expect(weatherData.sys.message, equals(0.0045));
    expect(weatherData.sys.country, equals("US"));
    expect(weatherData.sys.sunrise, equals(1547554184));
    expect(weatherData.sys.sunset, equals(1547592627));
    expect(weatherData.id, equals(420008716));
    expect(weatherData.cod, equals(200));
  }); 
}