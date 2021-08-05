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
              padding: const EdgeInsets.only(top: 50.0),
              child: FutureBuilder<factResponse>(
                  future: dataServices.getData(widget.loc),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var fm = new DateFormat('HH:mm dd EEE MM YYYY');
                      var fm_hour = new DateFormat.Hm();
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              "${snapshot.data!.name}",
                              style: const TextStyle(
                                fontSize: 30,
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
                              Text(
                                "${snapshot.data!.main.temp}",
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold, fontFamily: 'Overpass',
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Text(
                              "${fm.format(new DateTime.fromMillisecondsSinceEpoch(
                                (snapshot.data!.dt * 1000),
                              ))}",
                              style: const TextStyle(
                                fontSize: 20, fontFamily: 'Overpass',
                                color: Colors.black,
                              )),
                          Center(
                            child: Text(
                              "${snapshot.data!.weather[0].description}",
                              style: const TextStyle(
                                fontSize: 20, fontFamily: 'Overpass',
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Text(
                            "Min Temp:${snapshot.data!.main.tempMin}",
                            style: const TextStyle(
                              fontSize: 20, fontFamily: 'Overpass',
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Max Temp:${snapshot.data!.main.tempMax}/${snapshot.data!.wind.deg}",
                            style: const TextStyle(
                              fontSize: 20, fontFamily: 'Overpass',
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Wind(speed/deg):${snapshot.data!.wind.speed}/${snapshot.data!.wind.deg}",
                            style: const TextStyle(
                              fontSize: 20, fontFamily: 'Overpass',
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Pressure ${snapshot.data!.main.pressure} hpa",
                            style: const TextStyle(
                              fontSize: 20, fontFamily: 'Overpass',
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Humidity ${snapshot.data!.main.humidity}%",
                            style: const TextStyle(
                              fontSize: 20, fontFamily: 'Overpass',
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Sunrise ${fm_hour.format(new DateTime.fromMillisecondsSinceEpoch((snapshot.data!.sys.sunrise * 1000), isUtc: true))}",
                            style: const TextStyle(
                              fontSize: 20, fontFamily: 'Overpass',
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Sunset ${fm_hour.format(new DateTime.fromMillisecondsSinceEpoch((snapshot.data!.sys.sunset * 1000), isUtc: true))}",
                            style: const TextStyle(
                              fontSize: 20, fontFamily: 'Overpass',
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "GeoCode: [${snapshot.data!.coord.lat}/${snapshot.data!.coord.lon}]",
                            style: const TextStyle(
                              fontSize: 20, fontFamily: 'Overpass',
                              color: Colors.black,
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
