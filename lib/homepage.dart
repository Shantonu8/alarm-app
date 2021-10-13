import 'package:flutter/material.dart';
import 'package:weather_alarm_app/clock_view.dart';
import 'package:weather_alarm_app/constants/custom_app_bar.dart';
import 'constants/clock_info.dart';
import 'constants/custom_app_bar.dart';
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


class _HomePageState extends State<HomePage>
{

  @override
  void initState() {
    print(now);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      appBar:PreferredSize(preferredSize: Size.fromHeight(50),
      child: CustomAppBar("Clock")),
      body:
      Container(
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
                  fontFamily: 'avenir'
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





