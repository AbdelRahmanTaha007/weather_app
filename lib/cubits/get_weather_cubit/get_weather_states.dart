import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherData;

  WeatherLoadedState(this.weatherData);
}

class WeatherFailureState extends WeatherState {}
