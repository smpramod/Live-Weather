import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart'; // Make sure you have this import for DateFormat
import '../models/weather_model.dart';

// The formatTime function was missing its implementation for the 'data' variable
String formatTime(int timeStamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
  return DateFormat('hh:mm a').format(date);
}

class WeatherCard extends StatelessWidget {
  final Weather weather;

  const WeatherCard({super.key, required this.weather});

  String _getWeatherAnimation(String? description) {
    if (description == null) {
      return 'assets/cloudy.json';
    }
    final lowerCaseDescription = description.toLowerCase();
    if (lowerCaseDescription.contains('rain')) {
      return 'assets/rain.json';
    } else if (lowerCaseDescription.contains('clear')) {
      return 'assets/sunny.json';
    } else if (lowerCaseDescription.contains('cloud')) {
      return 'assets/cloudy.json';
    } else if (lowerCaseDescription.contains('snow')) {
      return 'assets/snowfall.json';
    }
    return 'assets/cloudy.json';
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color.fromARGB(113, 225, 255, 255),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(
                  _getWeatherAnimation(weather.description),
                  height: 150,
                  width: 150,
                ),
                Text(
                  weather.cityName,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 10),
                Text(
                  '${weather.temperature.toStringAsFixed(1)}°C',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  weather.description,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Humidity: ${weather.humitdity}%',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      'Wind: ${weather.windspeed} m/s',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Icon(Icons.wb_sunny_outlined, color: Colors.orange),
                        Text('Sunrise', style: Theme.of(context).textTheme.bodyMedium),
                        Text(
                          formatTime(weather.sunrise),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(Icons.nightlight_round, color: Colors.purple),
                        Text(
                          'Sunset',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          formatTime(weather.sunset),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
