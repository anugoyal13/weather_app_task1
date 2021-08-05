import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_task1/views/weather_data.dart';


class loadingPage extends StatefulWidget {
  const loadingPage({Key? key}) : super(key: key);

  @override
  _loadingPageState createState() => _loadingPageState();
}

class _loadingPageState extends State<loadingPage> {
  TextEditingController textlocationController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: Text(
            "Go",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) =>
                        WeatherApp(loc: textlocationController.text)));
          }),
      body: Container(
        child: Stack(
          children: [
            Container(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(
                  "assets/weather.jpg",
                  fit: BoxFit.cover,
                )),
            SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      " Weather ",
                      style: GoogleFonts.cabin(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      " App ",
                      style: GoogleFonts.cabin(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  ],
                ),
                SizedBox(
                  height: 250,
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 150),
                  child: TextField(
                    controller: textlocationController,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Overpass'),
                    decoration: InputDecoration(
                        hintText: "Enter location",
                        hintStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: 'Overpass'),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
