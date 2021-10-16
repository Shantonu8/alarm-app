import 'package:flutter/material.dart';
import 'package:weather_alarm_app/screens/homepage.dart';
import 'package:weather_alarm_app/screens/stopwatch_screen.dart';

import 'alarmscreen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  int index = 0;
  final screens = [
    HomePage(),
    AlarmScreen(),
    StopwatchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],

      bottomNavigationBar: NavigationBarTheme(
        
        data: NavigationBarThemeData(
          indicatorColor: Colors.blue,
          labelTextStyle: MaterialStateProperty.all(TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white
          ))
        ),
        child: NavigationBar(
          backgroundColor: Color(0xFF2D2F41),
          selectedIndex: index,
          // animationDuration: Duration(
          //   seconds: 3
          // ),
          onDestinationSelected: (index) {
            setState(() {
              this.index = index;
            });
          },
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          height: 60,
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_outlined, color: Colors.white,),
              selectedIcon: Icon(Icons.home, color: Colors.white,),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(Icons.add, color: Colors.white,),
              label: "Alarm",
            ),
            NavigationDestination(
              icon: Icon(Icons.timer, color: Colors.white,),
              label: "Stopwatch",
            ),
            NavigationDestination(
              icon: Icon(Icons.watch, color: Colors.white,),
              label: "Timer",
            ),

          ],
        ),
      ),
    );
  }
}
