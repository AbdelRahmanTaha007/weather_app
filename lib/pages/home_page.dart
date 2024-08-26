import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/widgets/no_weather_info.dart';
import 'package:weather_app/widgets/weather_info.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, this.weatherCondition}) : super(key: key);

  final String? weatherCondition;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return BlocBuilder<GetWeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherInitialState) {
          return  noWeatherInfo();
        } else if (state is WeatherLoadedState) {
          return  FetchedWeatherInfo();
        } else {
          return Text("Oops, There was an error");
        }
      },
    );
  }
}
