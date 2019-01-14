// import 'package:flutter_test/flutter_test.dart';
// import 'package:what_4_lunch/weather.dart';

// void main() {
//   test('mapPlace should convert a json string into a Place model', () {
//     String weatherJsonString = r"""{"weather":{"coord":{"lon":-80.09,"lat":26.41},"weather":[{"id":711,"main":"Smoke","description":"smoke","icon":"50d"}],"base":"stations","main":{"temp":73.13,"pressure":1019,"humidity":47,"temp_min":69.98,"temp_max":75.02},"visibility":16093,"wind":{"speed":9.17,"deg":310},"clouds":{"all":1},"dt":1547502780,"sys":{"type":1,"id":5373,"message":0.0039,"country":"US","sunrise":1547467791,"sunset":1547506186},"id":420008718,"name":"Boca Raton","cod":200}}""";
//     Place place = places.mapPlace(jsonStr);
//     expect(place.name, equals("Shane's"));
//     expect(place.address.address, equals("2240 NW 19th Street"));
//     expect(place.address.city, equals("Boca Raton"));
//     expect(place.address.state, equals("FL"));
//     expect(place.address.zipCode, equals("33431"));
//   }); 
// }