import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/pages/home_page.dart';

// import 'package:weather_app/models/weather_model.dart';

// import 'package:weather_app/services/weather_service.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  SearchPage();
  String? cityName;
  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return BlocBuilder<GetWeatherCubit, WeatherState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  getThemeColor(weatherModel?.weatherCondition),
                  getThemeColor(weatherModel?.weatherCondition)[300]!,
                  getThemeColor(weatherModel?.weatherCondition)[200]!,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
            ),
            // backgroundColor: getColor(weatherModel?.weatherCondition),
            title: const Text('Search a City'),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                onSubmitted: (data) {
                  //Triggres when pressed on the Search Icon
                  BlocProvider.of<GetWeatherCubit>(context)
                      .getWeather(cityName: data);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(weatherCondition:weatherModel?.weatherCondition,),
                      ));
                },
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                  label: const Text('search'),
                  suffixIcon: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.search)),
                  border: const OutlineInputBorder(),
                  hintText: 'Enter a city',
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
