import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/models/weather_model.dart';

class WeatherServices {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '6e5c6a9766e54bb28d064847230701';
  //getWeather constructor of WeatherServices
  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url = Uri.parse(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7&aqi=no&alerts=no');
    //     http://api.weatherapi.com/v1/forecast.json?key=6e5c6a9766e54bb28d064847230701&q=London&days=7&aqi=no&alerts=no
    http.Response response = await http.get(url);
    // named of map is data
    Map<String, dynamic> data = jsonDecode(response.body);
    WeatherModel weather = WeatherModel.fromJson(data);
    return weather;
  }
}
