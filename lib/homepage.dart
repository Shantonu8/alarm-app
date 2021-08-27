import 'package:flutter/material.dart';
import 'package:weather_alarm_app/clock_view.dart';


class HomePage extends StatelessWidget {

  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    var now = DateTime.now();
    var nowMinute = now.minute.toString();
    var nowHour = now.hour.toString();
    var nowDate = now.day.toString();
    var nowDay = now.weekday;

    // for  (int i  = 0; i < 100; i += 1 ){
    //   print(now);
    //   print(nowMinute)
    // }
//TODO: Find a way to determine the day from the day of the week and create a new variable to save it
    void _determineDay(){
      if (nowDay == 1) {

      }
      if (nowDay == 2) {

      }
      if (nowDay == 3) {

      }
      if (nowDay == 4) {

      }
      if (nowDay == 5) {

      }
      if (nowDay == 6) {

      }
      if (nowDay == 7) {

      }
    }

    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Container(
        alignment: Alignment.center,
        color: Color(0xFF2D2F41),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                nowHour + ":" + nowMinute,
                style: TextStyle(
                  fontSize: 60,
                  color:  Colors.white
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                nowHour + ":" + nowMinute,
                style: TextStyle(
                    fontSize: 20,
                    color:  Colors.white
                ),
              ),
            ),

            ClockView(),
          ],
        ),
      ),
    );
  }
}
