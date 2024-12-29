import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    super.key,
    required this.weather,
  });

  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
           getThemeColor(weatherModel.weatherCondition),
                      getThemeColor(weatherModel.weatherCondition)[300]!,
           getThemeColor(weatherModel.weatherCondition)[50]!,

          ],
        ),
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                weatherModel.cityName,
                style: TextStyle(fontSize: 30),
              )),
              Center(
                  child: Text(
                "Updated at ${(weatherModel.date.hour)}:${weatherModel.date.minute}",
                style: TextStyle(fontSize: 15),
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network("https:${weatherModel.image}"),
                  const SizedBox(
                    width: 35,
                  ),
                  Text(
                    weatherModel.temp.round().toString(),
                    style: TextStyle(fontSize: 40),
                  ),
                  const SizedBox(
                    width: 35,
                  ),
                  Column(
                    children: [
                      // round => round to the nearest integer
                      Text("MaxTemp:${weatherModel.maxTemp.round()}"),
                      Text("MaxTemp:${weatherModel.minTemp.round()}"),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                weatherModel.weatherCondition,
                style: TextStyle(fontSize: 35),
              ),
            ],
          ),
        ),
    );
      
      // appBar: AppBar(
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         Navigator.of(context).push(
      //           MaterialPageRoute(builder: (context) {
      //             return SearchPage();
      //           }),
      //         );
      //       },
      //       icon: const Icon(
      //         Icons.search,
      //         color: Colors.white,
      //       ),
      //     ),
      //   ],
      //   elevation: 0,
      //   backgroundColor: Colors.blue,
      //   title: const Text(
      //     'Weather App',
      //     style: TextStyle(
      //       color: Colors.white,
      //     ),
      //   ),
      // ),
      // body: const NoWeatherBody(),
    
  
}

// DateTime stringToDateTime(String value) {
//   return DateTime.parse(value);
// }
}