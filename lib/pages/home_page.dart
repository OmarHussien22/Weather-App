import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/pages/search_page.dart';
import 'package:weatherapp/providers/weather_provider.dart';
import 'package:weatherapp/services/weather_services.dart';

class HomePAge extends StatefulWidget {
  const HomePAge({super.key});

  @override
  State<HomePAge> createState() => _HomePAgeState();
}

class _HomePAgeState extends State<HomePAge> {
  void updateUi() {
    setState(() {});
  }

  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return SearchPage(
                      updateUi: updateUi,
                    );
                  })));
                }),
                icon: const Icon(
                  Icons.search,
                ))
          ],
          title: const Text('Weather App'),
        ),
        body: Provider.of<WeatherProvider>(context).weatherData == null
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'there is no weather 😔 start',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      'searching now 🔍',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    )
                  ],
                ),
              )
            : Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  weatherData!.getThemeColor(),
                  weatherData!.getThemeColor()[50]!,
                  weatherData!.getThemeColor()[100]!
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 3,
                    ),
                    Text(
                      Provider.of<WeatherProvider>(context).cityName!,
                      style: const TextStyle(
                          fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      weatherData!.data,
                      style: const TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(weatherData!.getImage()),
                        Text(
                          weatherData!.temp.toInt().toString(),
                          style: const TextStyle(
                              fontSize: 55, fontWeight: FontWeight.bold),
                        ),
                        Column(
                          children: [
                            Text(
                              'Max Temp : ${weatherData!.maxTemp.toInt()}',
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              'Min Temp : ${weatherData!.minTemp.toInt()}',
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      weatherData!.weatherStateName,
                      style: const TextStyle(
                          fontSize: 38, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(
                      flex: 4,
                    )
                  ],
                ),
              ));
  }
}
