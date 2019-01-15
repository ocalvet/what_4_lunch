import 'package:flutter_test/flutter_test.dart';
import 'package:what_4_lunch/place.dart';
import 'package:what_4_lunch/place_service.dart';

void main() {
  test('mapPlace should convert a json string into a Place model', () {
    String jsonStr = """{"name":"Shane's","imageUrl":"https://shanesmedia.azureedge.net/images/logo.png","addresses":[{"address":"2240 NW 19th Street","city":"Boca Raton","state":"FL","zipCode":"33431"}]}""";
    Place place = places.mapPlace(jsonStr);
    expect(place.name, equals("Shane's"));
    expect(place.addresses[0].address, equals("2240 NW 19th Street"));
    expect(place.addresses[0].city, equals("Boca Raton"));
    expect(place.addresses[0].state, equals("FL"));
    expect(place.addresses[0].zipCode, equals("33431"));
  }); 
}