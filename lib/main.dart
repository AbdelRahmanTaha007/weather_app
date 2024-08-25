import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/pages/home_page.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: CustomMaterialApp(),
    );
  }}


class CustomMaterialApp extends StatelessWidget {
  const CustomMaterialApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
            .weatherModel?.weatherCondition) 
      ),
    );
  }
}











  MaterialColor getThemeColor(String? condition) {
    if (condition == null) {
      return Colors.blue;
    }

    switch (condition) {
      case 'Sunny':
        return Colors.orange;
      case 'Clear':
        return Colors.lightBlue;
      case 'Partly cloudy':
        return Colors.blueGrey;
      case 'Cloudy':
        return Colors.grey;
      case 'Overcast':
        return Colors.blueGrey;
      case 'Mist':
        return Colors.blue;
      case 'Patchy rain possible':
        return Colors.lightBlue;
      case 'Patchy snow possible':
        return Colors.grey;
      case 'Patchy sleet possible':
        return Colors.lightBlue;
      case 'Patchy freezing drizzle possible':
        return Colors.cyan;
      case 'Thundery outbreaks possible':
        return Colors.purple;
      case 'Blowing snow':
        return Colors.lightBlue;
      case 'Blizzard':
        return Colors.grey;
      case 'Fog':
        return Colors.grey;
      case 'Freezing fog':
        return Colors.cyan;
      case 'Patchy light drizzle':
        return Colors.lightBlue;
      case 'Light drizzle':
        return Colors.lightBlue;
      case 'Freezing drizzle':
        return Colors.cyan;
      case 'Heavy freezing drizzle':
        return Colors.cyan;
      case 'Patchy light rain':
        return Colors.lightBlue;
      case 'Light rain':
        return Colors.blue;
      case 'Moderate rain at times':
        return Colors.blue;
      case 'Moderate rain':
        return Colors.blue;
      case 'Heavy rain at times':
        return Colors.indigo;
      case 'Heavy rain':
        return Colors.indigo;
      case 'Light freezing rain':
        return Colors.cyan;
      case 'Moderate or heavy freezing rain':
        return Colors.cyan;
      case 'Light sleet':
        return Colors.grey;
      case 'Moderate or heavy sleet':
        return Colors.grey;
      case 'Patchy light snow':
        return Colors.cyan;
      case 'Light snow':
        return Colors.cyan;
      case 'Patchy moderate snow':
        return Colors.indigo;
      case 'Moderate snow':
        return Colors.indigo;
      case 'Patchy heavy snow':
        return Colors.grey;
      case 'Heavy snow':
        return Colors.red;
      case 'Ice pellets':
        return Colors.cyan;
      case 'Light rain shower':
        return Colors.lightBlue;
      case 'Moderate or heavy rain shower':
        return Colors.blue;
      case 'Torrential rain shower':
        return Colors.indigo;
      case 'Light sleet showers':
        return Colors.grey;
      case 'Moderate or heavy sleet showers':
        return Colors.grey;
      case 'Light snow showers':
        return Colors.deepPurple;
      case 'Moderate or heavy snow showers':
        return Colors.deepPurple;
      case 'Light showers of ice pellets':
        return Colors.cyan;
      case 'Moderate or heavy showers of ice pellets':
        return Colors.cyan;
      case 'Patchy light rain with thunder':
        return Colors.purple;
      case 'Moderate or heavy rain with thunder':
        return Colors.deepPurple;
      case 'Patchy light snow with thunder':
        return Colors.purple;
      case 'Moderate or heavy snow with thunder':
        return Colors.deepPurple;
      default:
        return Colors
            .blue; // Default color if the condition doesn't match any case
    }
  }
