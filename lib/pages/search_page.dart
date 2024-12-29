import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text(
          'Search City',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              onSubmitted: (value) async {
             var getWeatherCubit= BlocProvider.of<GetWeatherCubit>(context);
             getWeatherCubit.getWeather(cityName: value);
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                label: Text(
                  "Searh",
                  style: TextStyle(color: Colors.amberAccent),
                ),
                hintText: "Enter City Name",

                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.amberAccent,
                  ),
                  // borderRadius: BorderRadius.circular(16),
                ),
                // enabledBorder: OutlineInputBorder(
                //   borderSide: BorderSide(
                //     color: Colors.grey,
                //   ),

                // ),
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
