import 'package:flutter/material.dart';
import 'package:weather_app_task1/views/loadingpage.dart';




void main() {
  runApp(MaterialApp(
      routes: {
        "/": (context)=>loadingPage(),
        // "/home":(context)=> WeatherApp(),
      },
      debugShowCheckedModeBanner: false)



  );

}





