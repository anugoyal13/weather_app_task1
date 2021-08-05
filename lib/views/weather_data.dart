import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_task1/models/factResponse.dart';
import 'package:weather_app_task1/services/DataService.dart';

class WeatherApp extends StatefulWidget {
  late String loc;
  WeatherApp({required this.loc});
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {

  DataServices dataServices = DataServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    print("set state called");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("widget distroyed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: FutureBuilder<factResponse>(
                  future: dataServices.getData(widget.loc),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var fm = new DateFormat('HH:mm dd EEE MM ');
                      var fm_hour = new DateFormat.Hm();
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              "${snapshot.data!.name}",
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Overpass',
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                  "https://openweathermap.org/img/w/${snapshot.data!.weather[0].icon}.png"),
                              Row(
                                children: [
                                  Text(
                                    (snapshot.data!.main.temp - 273.15)
                                        .toInt()
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Overpass',
                                      color: Colors.black,
                                    ),
                                  ),
                                  Container(
                                      height: 50,
                                      width: 50,
                                      child: Image.asset(
                                        "assets/degreecelcius.png",
                                        fit: BoxFit.cover,
                                      )),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "${fm.format(new DateTime.fromMillisecondsSinceEpoch(
                                  (snapshot.data!.dt * 1000),
                                ))}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Overpass',
                                  color: Colors.black,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                "${snapshot.data!.weather[0].description}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Overpass',
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Min Temp:  ${(snapshot.data!.main.tempMin - 273.15).toInt()}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Overpass',
                                    color: Colors.black,
                                  ),
                                ),
                                Container(
                                    height: 15,
                                    width: 50,
                                    child: Image.asset(
                                      "assets/degreecelcius.png",
                                      fit: BoxFit.cover,
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Max Temp:  ${(snapshot.data!.main.tempMax - 273.15).toInt()}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Overpass',
                                    color: Colors.black,
                                  ),
                                ),
                                Container(
                                    height: 15,
                                    width: 50,
                                    child: Image.asset(
                                      "assets/degreecelcius.png",
                                      fit: BoxFit.cover,
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Wind(speed/deg):  ${snapshot.data!.wind.speed}/${snapshot.data!.wind.deg}",
                              style: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'Overpass',
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Pressure:  ${snapshot.data!.main.pressure} hpa",
                              style: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'Overpass',
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Humidity:  ${snapshot.data!.main.humidity}%",
                              style: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'Overpass',
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Sunrise:  ${fm_hour.format(new DateTime.fromMillisecondsSinceEpoch((snapshot.data!.sys.sunrise * 1000), isUtc: true))}",
                              style: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'Overpass',
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Sunset:  ${fm_hour.format(new DateTime.fromMillisecondsSinceEpoch((snapshot.data!.sys.sunset * 1000), isUtc: true))}",
                              style: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'Overpass',
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "GeoCode:  [${snapshot.data!.coord.lat}/${snapshot.data!.coord.lon}]",
                              style: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'Overpass',
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
