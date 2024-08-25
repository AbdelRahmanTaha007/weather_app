import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());

  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
      // ignore: unused_local_variable
      weatherModel =
          await WeatherService(Dio()).getForecast(cityName: cityName);
      emit(WeatherLoadedState(weatherModel!));
      // ignore: unused_catch_clause
    } on Exception catch (e) {
      emit(WeatherFailureState());
    }
  }
}
