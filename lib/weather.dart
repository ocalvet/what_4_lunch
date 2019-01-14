class Weather {
  final String coord;
  final String weather;
  final String base;
  final String main;
  final String visibility;
  final String wind;
  final String clouds;
  final String dt;
  final String sys;
  final String id;
  final String name;
  final String cod;

  Weather({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.id,
    this.name,
    this.cod,
  });

  static Weather fromJson(Map<String, dynamic> json) {
    return Weather(
      coord: json['coord'],
      weather: json['weather'],
      base: json['base'],
      main: json['main'],
      visibility: json['visibility'],
      wind: json['wind'],
      clouds: json['clouds'],
      dt: json['dt'],
      sys: json['sys'],
      id: json['id'],
      name: json['name'],
      cod: json['cod'],
    );
  }

  Map<String, dynamic> toJson() => {
        'coord': coord,
        'weather': weather,
        'base': base,
        'main': main,
        'visibility': visibility,
        'wind': wind,
        'clouds': clouds,
        'dt': dt,
        'sys': sys,
        'id': id,
        'name': name,
        'cod': cod,
      };
}
