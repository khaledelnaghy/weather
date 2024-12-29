import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/pages/home_page.dart';

void main() {
  runApp(const WeatherApp());
}

class CsutomMatrialApp extends StatelessWidget {
  const CsutomMatrialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherStates>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition,
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomePage(),
            );
          },
        ),
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
    case "clear":
    case 'Partly cloudy':
    case 'Cloudy':
    case 'Overcast':
      return Colors.blueGrey;
    case "Mist":
    case "Fog":
    case "Freezing fog":
      return Colors.blueGrey;
    case "Patchy rain possible":
    case "Patchy light rain":
    case "Light rain":
    case "Moderate rain at times":
    case "Moderate rain":
    case "Heavy rain at times":
    case "Heavy rain":
    case "Light rain shower":
    case "Moderate or heavy rain shower":
    case "Torential rain shower":
      return Colors.lightBlue;
    case "Patchy snow possible":
    case "Patchy light snow":
    case "Light snow":
    case "Patchy moderate snow":
    case "Moderate snow":
    case "Patchy heavy snow":
    case "Heavy snow":
    case "light snow showers":
    case "Moderate or heavy snow showers":
      return Colors.lightBlue;
    case "Patchy freezing drizzle possible":
    case "Patchy freezing rain":
    case "Moderate or heavy freezing rain":
    case "Light showers of ice pellets":
    case "Moderate or heavy showers of ice pellets":
    case "Thundery outbreaks possible":
    case "Patchy light rain with thunder":
    case "Moderate or heavy rain with thunder":
    case "Ice pellets":
    case "Blowing snow":
    case "Blizzard":
      return Colors.lightBlue;
    default:
      return Colors.blue;
  }
}
