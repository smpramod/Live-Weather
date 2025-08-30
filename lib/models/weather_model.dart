class Weather{

  final String cityName;
  final double temperature;
  final String description;
  final int humitdity;
  final double windspeed;
  final int sunrise,sunset;

  Weather({required this.cityName,
      required this.description,
      required this.humitdity,
      required this.sunrise,
      required this.sunset,
      required this.windspeed,
      required this.temperature});

  factory Weather.FromJson(Map<String,dynamic>json){
    return Weather(cityName: json['name'], description: json['weather']['description'], humitdity: json['main']['humidity'], sunrise: json['sys']['sunrise'], sunset: json['sys']['sunset'], windspeed: json['wind']['speed'], temperature: json['main']['temp']-273.35);
  }
}