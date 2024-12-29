class WeatherModel {
  final String cityName;
  final DateTime date;
  final String? image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;

  WeatherModel(
      {required this.cityName,
      required this.date,
      this.image,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherCondition
      });
      factory WeatherModel.fromJson(jason){

        return WeatherModel(
          cityName: jason['location']['name'],
          date: DateTime.parse(jason['current']['last_updated']),
          image: jason['forecast']['forecastday'][0]['day']['condition']['icon'],
          temp: jason['forecast']['forecastday'][0]['day']['avgtemp_c'],
          maxTemp: 30.5,
          // maxTemp: jason['forecast']['forecastday'][0]['day']['maxtemp_c'],
          minTemp: jason['forecast']['forecastday'][0]['day']['mintemp_c'],
          weatherCondition: jason['forecast']['forecastday'][0]['day']['condition']['text'],
        );
      }
}
