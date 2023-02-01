/// coord : {"lon":72.8333,"lat":21.1667}
/// weather : [{"id":721,"main":"Haze","description":"haze","icon":"50d"}]
/// base : "stations"
/// main : {"temp":302.14,"feels_like":302.56,"temp_min":302.14,"temp_max":302.14,"pressure":1012,"humidity":48}
/// visibility : 4000
/// wind : {"speed":5.14,"deg":20}
/// clouds : {"all":7}
/// dt : 1675162673
/// sys : {"type":1,"id":9071,"country":"IN","sunrise":1675129576,"sunset":1675169857}
/// timezone : 19800
/// id : 1255364
/// name : "Surat"
/// cod : 200

class WeatherModel {
  WeatherModel({
      Coord? coord, 
      List<Weather>? weather, 
      String? base, 
      Main? main, 
      num? visibility, 
      Wind? wind, 
      Clouds? clouds, 
      num? dt, 
      Sys? sys, 
      num? timezone, 
      num? id, 
      String? name, 
      num? cod,}){
    _coord = coord;
    _weather = weather;
    _base = base;
    _main = main;
    _visibility = visibility;
    _wind = wind;
    _clouds = clouds;
    _dt = dt;
    _sys = sys;
    _timezone = timezone;
    _id = id;
    _name = name;
    _cod = cod;
}

  WeatherModel.fromJson(dynamic json) {
    _coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      _weather = [];
      json['weather'].forEach((v) {
        _weather?.add(Weather.fromJson(v));
      });
    }
    _base = json['base'];
    _main = json['main'] != null ? Main.fromJson(json['main']) : null;
    _visibility = json['visibility'];
    _wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    _clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    _dt = json['dt'];
    _sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    _timezone = json['timezone'];
    _id = json['id'];
    _name = json['name'];
    _cod = json['cod'];
  }
  Coord? _coord;
  List<Weather>? _weather;
  String? _base;
  Main? _main;
  num? _visibility;
  Wind? _wind;
  Clouds? _clouds;
  num? _dt;
  Sys? _sys;
  num? _timezone;
  num? _id;
  String? _name;
  num? _cod;
WeatherModel copyWith({  Coord? coord,
  List<Weather>? weather,
  String? base,
  Main? main,
  num? visibility,
  Wind? wind,
  Clouds? clouds,
  num? dt,
  Sys? sys,
  num? timezone,
  num? id,
  String? name,
  num? cod,
}) => WeatherModel(  coord: coord ?? _coord,
  weather: weather ?? _weather,
  base: base ?? _base,
  main: main ?? _main,
  visibility: visibility ?? _visibility,
  wind: wind ?? _wind,
  clouds: clouds ?? _clouds,
  dt: dt ?? _dt,
  sys: sys ?? _sys,
  timezone: timezone ?? _timezone,
  id: id ?? _id,
  name: name ?? _name,
  cod: cod ?? _cod,
);
  Coord? get coord => _coord;
  List<Weather>? get weather => _weather;
  String? get base => _base;
  Main? get main => _main;
  num? get visibility => _visibility;
  Wind? get wind => _wind;
  Clouds? get clouds => _clouds;
  num? get dt => _dt;
  Sys? get sys => _sys;
  num? get timezone => _timezone;
  num? get id => _id;
  String? get name => _name;
  num? get cod => _cod;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_coord != null) {
      map['coord'] = _coord?.toJson();
    }
    if (_weather != null) {
      map['weather'] = _weather?.map((v) => v.toJson()).toList();
    }
    map['base'] = _base;
    if (_main != null) {
      map['main'] = _main?.toJson();
    }
    map['visibility'] = _visibility;
    if (_wind != null) {
      map['wind'] = _wind?.toJson();
    }
    if (_clouds != null) {
      map['clouds'] = _clouds?.toJson();
    }
    map['dt'] = _dt;
    if (_sys != null) {
      map['sys'] = _sys?.toJson();
    }
    map['timezone'] = _timezone;
    map['id'] = _id;
    map['name'] = _name;
    map['cod'] = _cod;
    return map;
  }

}

/// type : 1
/// id : 9071
/// country : "IN"
/// sunrise : 1675129576
/// sunset : 1675169857

class Sys {
  Sys({
      num? type, 
      num? id, 
      String? country, 
      num? sunrise, 
      num? sunset,}){
    _type = type;
    _id = id;
    _country = country;
    _sunrise = sunrise;
    _sunset = sunset;
}

  Sys.fromJson(dynamic json) {
    _type = json['type'];
    _id = json['id'];
    _country = json['country'];
    _sunrise = json['sunrise'];
    _sunset = json['sunset'];
  }
  num? _type;
  num? _id;
  String? _country;
  num? _sunrise;
  num? _sunset;
Sys copyWith({  num? type,
  num? id,
  String? country,
  num? sunrise,
  num? sunset,
}) => Sys(  type: type ?? _type,
  id: id ?? _id,
  country: country ?? _country,
  sunrise: sunrise ?? _sunrise,
  sunset: sunset ?? _sunset,
);
  num? get type => _type;
  num? get id => _id;
  String? get country => _country;
  num? get sunrise => _sunrise;
  num? get sunset => _sunset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['id'] = _id;
    map['country'] = _country;
    map['sunrise'] = _sunrise;
    map['sunset'] = _sunset;
    return map;
  }

}

/// all : 7

class Clouds {
  Clouds({
      num? all,}){
    _all = all;
}

  Clouds.fromJson(dynamic json) {
    _all = json['all'];
  }
  num? _all;
Clouds copyWith({  num? all,
}) => Clouds(  all: all ?? _all,
);
  num? get all => _all;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['all'] = _all;
    return map;
  }

}

/// speed : 5.14
/// deg : 20

class Wind {
  Wind({
      num? speed, 
      num? deg,}){
    _speed = speed;
    _deg = deg;
}

  Wind.fromJson(dynamic json) {
    _speed = json['speed'];
    _deg = json['deg'];
  }
  num? _speed;
  num? _deg;
Wind copyWith({  num? speed,
  num? deg,
}) => Wind(  speed: speed ?? _speed,
  deg: deg ?? _deg,
);
  num? get speed => _speed;
  num? get deg => _deg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['speed'] = _speed;
    map['deg'] = _deg;
    return map;
  }

}

/// temp : 302.14
/// feels_like : 302.56
/// temp_min : 302.14
/// temp_max : 302.14
/// pressure : 1012
/// humidity : 48

class Main {
  Main({
      num? temp, 
      num? feelsLike, 
      num? tempMin, 
      num? tempMax, 
      num? pressure, 
      num? humidity,}){
    _temp = temp;
    _feelsLike = feelsLike;
    _tempMin = tempMin;
    _tempMax = tempMax;
    _pressure = pressure;
    _humidity = humidity;
}

  Main.fromJson(dynamic json) {
    _temp = json['temp'];
    _feelsLike = json['feels_like'];
    _tempMin = json['temp_min'];
    _tempMax = json['temp_max'];
    _pressure = json['pressure'];
    _humidity = json['humidity'];
  }
  num? _temp;
  num? _feelsLike;
  num? _tempMin;
  num? _tempMax;
  num? _pressure;
  num? _humidity;
Main copyWith({  num? temp,
  num? feelsLike,
  num? tempMin,
  num? tempMax,
  num? pressure,
  num? humidity,
}) => Main(  temp: temp ?? _temp,
  feelsLike: feelsLike ?? _feelsLike,
  tempMin: tempMin ?? _tempMin,
  tempMax: tempMax ?? _tempMax,
  pressure: pressure ?? _pressure,
  humidity: humidity ?? _humidity,
);
  num? get temp => _temp;
  num? get feelsLike => _feelsLike;
  num? get tempMin => _tempMin;
  num? get tempMax => _tempMax;
  num? get pressure => _pressure;
  num? get humidity => _humidity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp'] = _temp;
    map['feels_like'] = _feelsLike;
    map['temp_min'] = _tempMin;
    map['temp_max'] = _tempMax;
    map['pressure'] = _pressure;
    map['humidity'] = _humidity;
    return map;
  }

}

/// id : 721
/// main : "Haze"
/// description : "haze"
/// icon : "50d"

class Weather {
  Weather({
      num? id, 
      String? main, 
      String? description, 
      String? icon,}){
    _id = id;
    _main = main;
    _description = description;
    _icon = icon;
}

  Weather.fromJson(dynamic json) {
    _id = json['id'];
    _main = json['main'];
    _description = json['description'];
    _icon = json['icon'];
  }
  num? _id;
  String? _main;
  String? _description;
  String? _icon;
Weather copyWith({  num? id,
  String? main,
  String? description,
  String? icon,
}) => Weather(  id: id ?? _id,
  main: main ?? _main,
  description: description ?? _description,
  icon: icon ?? _icon,
);
  num? get id => _id;
  String? get main => _main;
  String? get description => _description;
  String? get icon => _icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['main'] = _main;
    map['description'] = _description;
    map['icon'] = _icon;
    return map;
  }

}

/// lon : 72.8333
/// lat : 21.1667

class Coord {
  Coord({
      num? lon, 
      num? lat,}){
    _lon = lon;
    _lat = lat;
}

  Coord.fromJson(dynamic json) {
    _lon = json['lon'];
    _lat = json['lat'];
  }
  num? _lon;
  num? _lat;
Coord copyWith({  num? lon,
  num? lat,
}) => Coord(  lon: lon ?? _lon,
  lat: lat ?? _lat,
);
  num? get lon => _lon;
  num? get lat => _lat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lon'] = _lon;
    map['lat'] = _lat;
    return map;
  }

}