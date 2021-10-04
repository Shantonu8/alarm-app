import 'dart:async';

import 'package:flutter/material.dart';
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



class ClockInfo extends StatefulWidget {
  const ClockInfo({Key? key}) : super(key: key);

  @override
  _ClockInfoState createState() => _ClockInfoState();
}

class _ClockInfoState extends State<ClockInfo> {
  String nowMinute = '00', nowHour = '00', nowSeconds = '';
  late Timer timer;
  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) {setState(() {
        nowMinute = DateTime.now().minute.toString().padLeft(2, "0");
        nowHour = DateTime.now().hour.toString().padLeft(2, "0");
      });}
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Text(
            nowHour + ":" + nowMinute ,
            style: TextStyle(
              fontSize: 80,
              color:  Colors.white,
              // fontWeight: FontWeight.w100,
            ),
            textAlign: TextAlign.start,
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