import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';

class FetchedWeatherInfo extends StatelessWidget {
  const FetchedWeatherInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          getThemeColor(weatherModel?.weatherCondition),
          getThemeColor(weatherModel?.weatherCondition)[300]!,
          getThemeColor(weatherModel?.weatherCondition)[50]!,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 3,
          ),
          Text(
            weatherModel!.cityName!,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'updated at : ${Hello(weatherModel.date).hour}:${Hello(weatherModel.date).minute}',
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network("https:${weatherModel.image}"),
              Text(
                "${weatherModel.temp}",
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Text(
                    'maxTemp :${weatherModel.maxTemp.toInt()}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'minTemp :${weatherModel.minTemp.toInt()}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Text(
            weatherModel.weatherCondition,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }
}

DateTime Hello(String value) {
  return DateTime.parse(value);
}
