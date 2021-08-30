import 'package:flutter/material.dart';
import 'package:weather_alarm_app/alarmscreen.dart';
import 'homepage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather Alarm App',
      theme: ThemeData(
        // textTheme: GoogleFonts.avenirTextTheme(
        // Theme.of(context).textTheme,),
        fontFamily: "Avenir",
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        "/alarm": (context) => AlarmScreen(),
      },
    );
  }
}

