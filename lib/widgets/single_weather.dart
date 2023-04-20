import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_weather_app/models/weather_locations.dart';
import 'package:flutter_weather_app/widgets/slider_date_selector.dart';
import 'package:flutter_weather_app/widgets/hourSlider.dart';
import 'package:flutter_weather_app/screens/weather_app_2.dart';
import 'package:flutter_weather_app/screens/shield.dart';
import 'package:flutter_weather_app/screens/settings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart';

// import 'package:flutter/material.dart';
//import 'package:flutter_date_picker_timeline/flutter_date_picker_timeline.dart';
// import 'package:intl/intl.dart';
// import 'package:date_picker_timeline/date_picker_timeline.dart';
// import 'hours.dart';

class SingleWeather extends StatelessWidget {
  final int index;
  final double temperature;
  final String weather;
  SingleWeather(this.index, this.temperature, this.weather);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 150,
                    ),
                    Text(
                      'Weather',
                      style: GoogleFonts.lato(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Addis Ababa',
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      temperature != null
                          ? temperature.toString() + '\u00B0'
                          : 'Loading',
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      weather != null
                          ? weather.toString() + '\u00B0'
                          : 'Loading',
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          height: 100,
                        ),
                        SvgPicture.asset(
                          locationList[index].iconUrl,
                          width: 100,
                          // height: 70,
                          color: Colors.white,
                        ),

                        SizedBox(
                          width: 100,
                          height: 100,
                          child: Expanded(child: hourSlider()),
                        )

                        // SizedBox(
                        //   width: 10,
                        // ),
                        //
                      ],
                    ),

                    // Row(children: [
                    //   SizedBox(
                    //     width: 100,
                    //     height: 100,
                    //     child: Expanded(child: hourSlider()),
                    //   )
                    // ]),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      locationList[index].temparature,
                      style: GoogleFonts.lato(
                        fontSize: 45,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          locationList[index].weatherType,
                          style: GoogleFonts.lato(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    // Column(
                    //   children: [
                    //     Container(
                    //       width: 100,
                    //       height: 0,
                    //       child: ListWheelScrollView.useDelegate(
                    //         controller: _controller,
                    //         itemExtent: 50,
                    //         perspective: 0.005,
                    //         diameterRatio: 1.2,
                    //         physics: FixedExtentScrollPhysics(),
                    //         childDelegate: ListWheelChildBuilderDelegate(
                    //           childCount: 13,
                    //           builder: (context, index) {
                    //             return MyHours(
                    //               hours: index,
                    //             );
                    //           },
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    // border: Border.all(
                    //   color: Colors.white30,
                    // ),
                    ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  // key: Provider.of<DateKeyProvider>(context).key,
                  // child: FlutterDatePickerTimeline(
                  //   startDate: DateTime(2020, 07, 01),
                  //   endDate: DateTime(2020, 12, 30),
                  //   initialSelectedDate: DateTime(2020, 07, 24),
                  //   onSelectedDateChange: (DateTime date) {
                  //     print('Selected day: ${DateFormat('EEEE').format(date)}');
                  //   },
                  // )
                  child: DemoApp()),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Badge(
                      child: Column(children: [
                        SizedBox(
                          child: Expanded(
                            child: ElevatedButton(
                              child: SvgPicture.asset(
                                'assets/location-pin-svgrepo-com.svg',
                                width: 30,
                                height: 30,
                                color: Colors.white,
                              ),

                              // child: Text('Open New Screen'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WeatherAppSecond()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.black,
                                elevation: 0,
                                // side: const BorderSide(
                                //   width: 1.0,
                                //   color: Colors.red,
                                // )
                              ),
                            ),
                          ),
                        ),
                      ]),
                      badgeContent: Text("3"),
                      badgeColor: Colors.blue,
                      position: BadgePosition.topEnd(),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          child: Expanded(
                            child: ElevatedButton(
                              child: SvgPicture.asset(
                                'assets/shield-svgrepo-com.svg',
                                width: 30,
                                height: 30,
                                color: Colors.white,
                              ),

                              // child: Text('Open New Screen'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Shield()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.black,
                                elevation: 0,
                                // side: const BorderSide(
                                //   width: 1.0,
                                //   color: Colors.red,
                                // )
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          child: Expanded(
                            child: ElevatedButton(
                              child: SvgPicture.asset(
                                'assets/settings-2-svgrepo-com.svg',
                                width: 30,
                                height: 30,
                                color: Colors.white,
                              ),

                              // child: Text('Open New Screen'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Settings()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.black,
                                elevation: 0,
                                // side: const BorderSide(
                                //   width: 1.0,
                                //   color: Colors.red,
                                // )
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
