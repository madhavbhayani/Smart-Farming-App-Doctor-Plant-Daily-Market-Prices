// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  List<Color> getcolors() {
    if (hour >= 6 && hour <= 11) {
      return [
        const Color.fromARGB(255, 94, 228, 237),
        const Color(0xFF3eadcf),
      ];
    } else if (hour > 11 && hour <= 16) {
      return [
        const Color(0xFFFF8000),
        const Color(0xFFFFA600),

        // const Color(0xFFFFDF00),
        // const Color(0xFFF6D108),
      ];
    } else if (hour > 16 && hour < 19) {
      return [
        const Color(0xFF4e54c8),
        const Color(0xFF9795ef),
      ];
    } else {
      return [const Color(0xff34495e), const Color(0xFF01162E)];
    }
  }

  String getweatherIcon(int condition) {
    if (condition < 300) {
      return 'assets/ic_storm_weather.png';
    } else if (condition < 400) {
      return 'assets/ic_rainy_weather.png';
    } else if (condition < 600) {
      return 'assets/ic_rainy_weather.png';
    } else if (condition < 700) {
      return 'assets/ic_snow_weather.png';
    } else if (condition < 800) {
      return 'assets/ic_mostly_cloudy.png';
    } else if (condition == 800) {
      return 'assets/ic_clear_day.png';
    } else if (condition <= 804) {
      return 'assets/ic_cloudy_weather.png';
    } else {
      return 'assets/ic_unknown.png';
    }
  }

  //vars for weather
  String _cityName = 'Fetching...';
  double _temperature = 25.0;
  double _feelsLike = 23;
  int _humidity = 40;
  int hour = DateTime.now().hour;
  int _id = 711;
  String _status = 'Smoke';
  int _pressure = 1016;
  dynamic _windspeed = 4.6;

//vars for forecast
  int? second;
  List<dynamic> forecast = [];
  List<dynamic> today = [];

  // final String apiKey = 'your_api_key';
  //below thing is to be implemented when the 60 calls are finished from a single api key
  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      _getWeather(position.latitude, position.longitude);
      _getForecast(position.latitude, position.longitude);
    } catch (e) {
      print(e);
    }
  }

  Future<void> _getWeather(double latitude, double longitude) async {
    // print(DateTime.now().day);
    // print(DateTime.fromMillisecondsSinceEpoch(1707490800000).day);
    // print(DateTime.parse('2024-02-09 15:00:00').hour);
    String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid={API KEY}&units=metric';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      setState(() {
        _cityName = data['name'] ?? '';
        _temperature = data['main']['temp'] ?? '';
        _humidity = data['main']['humidity'] ?? '';
        _feelsLike = data['main']['feels_like'] ?? '';
        _id = data['weather'][0]['id'] ?? '';
        _status = data['weather'][0]['main'] ?? '';
        _pressure = data['main']['pressure'] ?? '';
        _windspeed = data['wind']['speed'] ?? '';
      });
    } else {
      print(response.statusCode);
    }
  }

  Future<void> _getForecast(double latitude, double longitude) async {
    // print(latitude);
    // print(longitude);
    String url =
        'https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid={API KEY}&units=metric';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var i = 0;
      while (DateTime.now().day == data['list'][i]['dt_txt']) {
        // print('True');
        i++;
      }
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: getcolors(),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Weather",
                          style: TextStyle(
                            fontFamily: 'Lexend',
                            fontWeight: FontWeight.w500,
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                          Text(
                            _cityName,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                iconGetter(),
                const SizedBox(
                  height: 10,
                ),
                weatherData_Handle_UI(),
                const SizedBox(
                  height: 100,
                ),
                const Center(
                  child: Text(
                    "Weather Details Provided By OpenWeather",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox weatherData_Handle_UI() {
    return SizedBox(
                width: double.infinity,
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView(
                    primary: false,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    shrinkWrap: true,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.2), // softer black shadow
                              offset: const Offset(
                                  0, 4), // 4 pixels below the card
                              blurRadius:
                                  8, // bigger blur radius for softer edges
                              spreadRadius: 1, // extend the shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Card(
                          shadowColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 0,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  child: Image.asset(
                                    "assets/feelslike.png",
                                    scale: 7,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Feels Like",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                Text(
                                  "${_feelsLike.toStringAsFixed(1)}°C",
                                  style: const TextStyle(fontSize: 28),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.2), // softer black shadow
                              offset: const Offset(
                                  0, 4), // 4 pixels below the card
                              blurRadius:
                                  8, // bigger blur radius for softer edges
                              spreadRadius: 1, // extend the shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 0,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  child: Image.asset(
                                    "assets/humidity.png",
                                    scale: 7,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Humidity",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                Text(
                                  "${_humidity.toString()}%",
                                  style: const TextStyle(fontSize: 28),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.2), // softer black shadow
                              offset: const Offset(
                                  0, 4), // 4 pixels below the card
                              blurRadius:
                                  8, // bigger blur radius for softer edges
                              spreadRadius: 1, // extend the shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 0,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  child: Image.asset(
                                    "assets/pressure.png",
                                    scale: 7,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Pressure",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                Text(
                                  "${_pressure.toString()}mBar",
                                  style: const TextStyle(fontSize: 28),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.2), // softer black shadow
                              offset: const Offset(
                                  0, 4), // 4 pixels below the card
                              blurRadius:
                                  8, // bigger blur radius for softer edges
                              spreadRadius: 1, // extend the shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 0,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  child: Image.asset(
                                    "assets/wind.png",
                                    scale: 7,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Wind Speed",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                Text(
                                  "${_windspeed.toStringAsFixed(1)}kph",
                                  style: const TextStyle(fontSize: 28),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
  }

  Row iconGetter() {
    return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: Image.asset(
                      getweatherIcon(_id), //todo : implement function
                      fit: BoxFit.fill,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${_temperature.toStringAsFixed(1)}°C',
                        style: const TextStyle(
                            fontSize: 60, color: Colors.white),
                      ),
                      Text(
                        "${_status.toString()}",
                        style: const TextStyle(
                            color: Colors.white, fontSize: 24),
                      )
                    ],
                  )
                ],
              );
  }
}
