class Place {
  final String name;
  final Address address;

  Place({this.name, this.address});

  Place.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        address = Address.fromJson((json["addresses"] as List)[0]);
}

class Address {
  final String address;
  final String city;
  final String state;
  final String zipCode;

  Address({this.address, this.city, this.state, this.zipCode});

  Address.fromJson(Map<String, dynamic> json)
      : address = json["address"],
        city = json["city"],
        state = json["state"],
        zipCode = json["zipCode"];
}
