import 'dart:async';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:weather_alarm_app/clock_view.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';
var now = DateTime.now();
var nowDate = now.day.toString();
var nowDay = now.weekday;
var nowMonth = now.month;
var timezoneName= now.timeZoneName;
var utcTime = now.timeZoneOffset;
String finalUTCTime = utcTime.toString();



String determineDay(){
  if (nowDay == 1) {
    return "Sunday";
  }
  if (nowDay == 2) {
    return "Monday";
  }
  if (nowDay == 3) {
    return "Tuesday";
  }
  if (nowDay == 4) {
    return "Wednesday";
  }
  if (nowDay == 5) {
    return "Thursday";
  }
  if (nowDay == 6) {
    return "Friday";
  }
  if (nowDay == 7) {
    return "Saturday";
  }
  else {
    return "error";
  }

}
String determineMonth(){
  if (nowMonth == 1) {
    return "January";
  }
  if (nowMonth == 2) {
    return "February";
  }
  if (nowMonth == 3) {
    return "March";
  }
  if (nowMonth == 4) {
    return "April";
  }
  if (nowMonth == 5) {
    return "May";
  }
  if (nowMonth == 6) {
    return "June";
  }
  if (nowMonth == 7) {
    return "July";
  }
  if (nowMonth == 8) {
    return "August";
  }
  if (nowMonth == 9) {
    return "September";
  }
  if (nowMonth == 10) {
    return "October";
  }
  if (nowMonth == 11) {
    return "November";
  }
  if (nowMonth == 12) {
    return "December";
  }

  else {
    return "error";
  }
}
String weekDay = determineDay();
String month = determineMonth();

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
       bottomNavigationBar:
    SalomonBottomBar(
        currentIndex: _currentIndex, onTap: (i) => setState(() => _currentIndex = i),
        items: [
          SalomonBottomBarItem(icon: Icon(Icons.home), title: Text("Home"), selectedColor: Colors.pink, unselectedColor: Colors.white),
          SalomonBottomBarItem(icon: Icon(Icons.add), title: Text("Alarm"), selectedColor: Colors.yellow, unselectedColor: Colors.white),
          SalomonBottomBarItem(icon: Icon(Icons.timer), title: Text("Stopwatch"), selectedColor: Colors.orange, unselectedColor: Colors.white),
          SalomonBottomBarItem(icon: Icon(Icons.watch), title: Text("Timer"), selectedColor: Colors.cyan, unselectedColor: Colors.white)
        ],
    ),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: Text("Clock", style: TextStyle(
            fontSize: 20
          ),),
        ),
        elevation: 0,
        backgroundColor:  Color(0xFF2D2F41),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Color(0xFF2D2F41),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClockInfo(),
            ClockView(),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0,),
              child: Text(
                "Timezone" ,
                style: TextStyle(
                    fontSize: 20,
                    color:  Colors.white
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Text(
                 "🌐     "+ "UTC " + "+" + finalUTCTime[0] + finalUTCTime[1] + finalUTCTime[2] + finalUTCTime[3],
                style: TextStyle(
                    fontSize: 15,
                    color:  Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class ClockInfo extends StatefulWidget {
  const ClockInfo({Key? key}) : super(key: key);

  @override
  _ClockInfoState createState() => _ClockInfoState();
}

class _ClockInfoState extends State<ClockInfo> {
  String nowMinute = '', nowHour = '', nowSeconds = '';

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        nowMinute = DateTime.now().minute.toString().padLeft(2, "0");
        nowHour = DateTime.now().hour.toString().padLeft(2, "0");
        // print(UtcTime);
        // print(isUTC);
        // nowSeconds = DateTime.now().second.toString().padLeft(2, "0");
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Text(
            nowHour + ":" + nowMinute ,
            style: TextStyle(
                fontSize: 80,
                color:  Colors.white,
              fontWeight: FontWeight.w100
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(3, 0, 0, 30.0),
          child: Text(
            weekDay[0]+
                weekDay[1]+
                weekDay[2] + ", " + nowDate + " " + month[0] + month[1] + month[2] ,
            style: TextStyle(
                fontSize: 15,
                color:  Colors.white,
              fontWeight: FontWeight.w300
            ),
          ),
        ),
      ],
    );
  }
}

