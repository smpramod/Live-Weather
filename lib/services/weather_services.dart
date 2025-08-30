import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_weather/models/weather_model.dart';

class WeatherServices{

  final String apiKey='29b1c48abdc61e27f6c8826ffb389227';

  Future<Weather> fetchWeather(String cityName)async{
    final url=Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey');

    final response=await http.get(url);

    if(response.statusCode==200){
            return Weather.FromJson(json.decode(response.body));
    }else{
      throw Exception('Fsild to open Load Weather data');
    }
  }
}