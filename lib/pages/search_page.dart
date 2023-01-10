import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/providers/weather_provider.dart';
import 'package:weatherapp/services/weather_services.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  SearchPage({
    this.cityName,
    required void Function() updateUi,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Search a City',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              WeatherServices services = WeatherServices();
              WeatherModel weather =
                  await services.getWeather(cityName: cityName!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;

              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 30, horizontal: 25),
              border: OutlineInputBorder(),
              hintText: 'Enter City',
              suffixIcon: Icon(Icons.search),
              label: Text('Search'),
            ),
          ),
        )));
  }
}
