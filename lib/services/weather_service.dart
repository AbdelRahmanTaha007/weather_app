import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = "http://api.weatherapi.com/v1";
  final String apiKey = "789662a8b58348f2a94205423240208";
  WeatherService(this.dio);

  Future<WeatherModel> getForecast({required String cityName}) async {
    try {
      Response response = await dio
          .get("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1");

      WeatherModel weather = WeatherModel.fromJson(response.data);
      return weather;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['messagw'] ??
          "Oops there was an Error, Try later";
      print(errorMessage);
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Oops there was an Error, Try later');
    }
  }
}




















// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:weather_app/models/weather_model.dart';

// class WeatherService {
//   String baseUrl = 'http://api.weatherapi.com/v1';

//   String apiKey = '7e65ad2abc02443b98b204047240208';
//   Future<WeatherModel> getWeather({required String cityName}) async {
//     Uri url =
//         Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
//     http.Response response = await http.get(url);

//     if (response.statusCode == 400) {
//     var data  = jsonDecode(response.body);
//       throw Exception(data['error']['message']);
//     }
//     Map<String, dynamic> data = jsonDecode(response.body);

//     WeatherModel weather = WeatherModel.fromJson(data);

//     return weather;
//   }
// }
