import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transformer_page_view/transformer_page_view.dart';
import '../models/weather_locations.dart';
import '../widgets/buildin_transform.dart';
import '../widgets/single_weather.dart';
import '../widgets/slider_dot.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  int _currentPage = 0;
  String bgImg;
  String colorFilter;

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  var temperature;
  var description;
  var currently;
  var humidity;
  var windSpeed;
  var weather;

  Future getWeather() async {
    http.Response response = await http.get(
        //'http://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/Addis%20Ababa?unitGroup=metric&key=LC778D62LHW3ZRZT92T4P7LDN&contentType=json');
        'https://api.openweathermap.org/data/2.5/weather?lat=9.0107934&lon=38.7612525&appid=55a34e1db72cf54e0a253cc09164718d');
    var results = json.decode(response.body);

    setState(() {
      // this.city = results['main']['address'];
      this.temperature = results['main']['temp'];
      this.description = results['weather'][0]['description'];
      this.weather = results['weather'][0]['main'];
      this.currently = results['weather'][0]['main'];
      this.humidity = results['main']['humidity'];
      this.windSpeed = results['wind']['speed'];
    });
  }

  @override
  void initState() {
    super.initState();
    this.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    if (locationList[_currentPage].weatherType == 'Sunny') {
      bgImg = 'assets/sunnyFlow2.png';
      ColorFilter.mode(Colors.greenAccent.withOpacity(0.2), BlendMode.darken);
    } else if (locationList[_currentPage].weatherType == 'Night') {
      bgImg = 'assets/rainFlow3.png';
      ColorFilter.mode(Colors.greenAccent.withOpacity(0.2), BlendMode.darken);
    } else if (locationList[_currentPage].weatherType == 'Rainy') {
      bgImg = 'assets/rainFlow3.png';
      ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken);
    } else if (locationList[_currentPage].weatherType == 'Cloudy') {
      bgImg = 'assets/stormFlow1.png';
      ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken);
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              bgImg,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.black38),
            ),
            Container(
              margin: EdgeInsets.only(top: 50, left: 15),
              child: Row(
                children: [
                  for (int i = 0; i < locationList.length; i++)
                    if (i == _currentPage) SliderDot(true) else SliderDot(false)
                ],
              ),
            ),
            TransformerPageView(
              scrollDirection: Axis.horizontal,
              transformer: ScaleAndFadeTransformer(),
              viewportFraction: 0.8,
              onPageChanged: _onPageChanged,
              itemCount: locationList.length,
              itemBuilder: (ctx, i) => SingleWeather(i, temperature, weather),
            ),
          ],
        ),
      ),
    );
  }
}
