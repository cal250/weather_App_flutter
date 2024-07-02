import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/weather_model.dart';
import 'package:flutter_application_1/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final WeatherService _weatherService =
      WeatherService('23474f85c62938615d08f2d30942d65e');
  Weather? _weather;

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  _fetchWeather() async {
    try {
      // Get the current city name
      String cityName = await _weatherService.getCurrentCity();

      // Get weather for the city
      Weather weather = await _weatherService.getWeather(cityName);
      
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // City name
            Text(_weather?.cityName ?? "Loading city..."),
            // Temperature
            Text('${(_weather?.temperature ?? 0).round()} Celsius'),
          ],
        ),
      ),
    );
  }
}
