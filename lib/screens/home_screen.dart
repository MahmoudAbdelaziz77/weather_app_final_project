import 'package:flutter/material.dart';
import 'package:weather_app/screens/no_weather_body.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/screens/weather_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: weatherModel == null ? NoWeatherBody() : WeatherBody(),
    );
  }
}
