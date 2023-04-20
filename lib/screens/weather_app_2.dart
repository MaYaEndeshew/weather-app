import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_svg/svg.dart';
// import '../models/weather_locations.dart';
import 'package:flutter_weather_app/screens/weather_app.dart';
// import 'dart:developer';
// void main() {
//   runApp(MyApp());
// }

class WeatherAppSecond extends StatefulWidget {
  @override
  _WeatherAppSecondState createState() => _WeatherAppSecondState();
}

class _WeatherAppSecondState extends State<WeatherAppSecond> {
  var temperature;
  var description;
  var currently;
  var humidity;
  var windSpeed;

  Future getWeather() async {
    http.Response response = await http.get(
        //'http://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/Addis%20Ababa?unitGroup=metric&key=LC778D62LHW3ZRZT92T4P7LDN&contentType=json');
        'https://api.openweathermap.org/data/2.5/weather?lat=9.0107934&lon=38.7612525&appid=55a34e1db72cf54e0a253cc09164718d');
    var results = json.decode(response.body);

    setState(() {
      // this.city = results['main']['address'];
      this.temperature = results['main']['temp'];
      this.description = results['weather'][0]['description'];
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(''),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WeatherApp()),
              );
            },
            icon: Icon(
              Icons.arrow_back_outlined,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3.5,
              width: MediaQuery.of(context).size.width,
              color: Colors.greenAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      "Currently in Addis Ababa",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    temperature != null
                        ? temperature.toString() + '\u00B0'
                        : 'Loading',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      currently != null ? currently.toString() : 'Loading',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(FontAwesomeIcons.temperatureHalf),
                      title: Text('Temperature'),
                      trailing: Text(temperature != null
                          ? temperature.toString() + '\u00B0'
                          : 'Loading'),
                    ),
                    ListTile(
                      leading: Icon(FontAwesomeIcons.cloud),
                      title: Text('Weather'),
                      trailing: Text(description != null
                          ? description.toString()
                          : 'Loading'),
                    ),
                    ListTile(
                      leading: Icon(FontAwesomeIcons.sun),
                      title: Text('Humidity'),
                      trailing: Text(
                          humidity != null ? humidity.toString() : 'Loading'),
                    ),
                    ListTile(
                      leading: Icon(FontAwesomeIcons.wind),
                      title: Text('Wind Speed'),
                      trailing: Text(windSpeed != null
                          ? windSpeed.toString() + 'km/h'
                          : 'Loading'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
