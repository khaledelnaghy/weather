import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  final Dio dio;

  final String baseUrl = "https://api.weatherapi.com/v1";
  final String apiKey = "35dfe80322bb4bb69a8192302241812";
  WeatherServices(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1");


      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data["error"]["message"] ??
          "opps there was an error , try later";
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("opps there was an error , try later");
    }
  }
}
