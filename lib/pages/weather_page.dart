import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/weather_model.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

//api key
final _WeatherService = WeatherService(apikey);
Weather? _weather;

//fetch weather

_fetchWeather() async {
  //get the current city 
  String cityName = await _WeatherService.getCurrentcity();
}
//get weather for city

try {
  final Weather = await _WeatherService.getWeather(cityName);
  setState(() {
    _weather = _weather;
  });
}

//any errors
catch (e){
  print(e);
}



@override
void initState(){
  super.initState();

  
  //fetch weather on startup
_fetchWeather();
}




//weather animations
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}