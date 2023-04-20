import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/svg.dart';
import '../models/weather_locations.dart';
import 'package:flutter_weather_app/screens/weather_app.dart';
// void main() {
//   runApp(MyApp());
// }

class Shield extends StatefulWidget {
  @override
  _ShieldState createState() => _ShieldState();
}

class _ShieldState extends State<Shield> {
  var temperature;
  var description;
  var currently;
  var humidity;
  var windSpeed;

  Future getWeather() async {
    http.Response response = await http.get(
        'http://api.openweathermap.org/data/2.5/weather?q=London&appid=YOUR_API_KEY&units=metric');
    var results = json.decode(response.body);
    setState(() {
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
                      'Shield',
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
