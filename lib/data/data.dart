import 'package:flutter/cupertino.dart';
import 'package:weather_alarm_app/models/alarm_info.dart';

List<AlarmInfo> alarms = [
  AlarmInfo(DateTime.now().add(Duration(hours: 1)), 'Office', false, GradientColors.sky),
  AlarmInfo(DateTime.now().add(Duration(hours: 1)), 'Office', false, GradientColors.sunset),
  AlarmInfo(DateTime.now().add(Duration(hours: 1)), 'Office', false, GradientColors.sea),
  AlarmInfo(DateTime.now().add(Duration(hours: 1)), 'Office', false, GradientColors.mango),
  AlarmInfo(DateTime.now().add(Duration(hours: 1)), 'Office', false, GradientColors.fire),
  AlarmInfo(DateTime.now().add(Duration(hours: 1)), 'Office', false, GradientColors.sky),
];


class GradientColors{
 static List<Color> sky = [Color(0xff6448fe), Color(0xff5fc6ff)];
 static List<Color> sunset = [Color(0xfffe6197), Color(0xffffb463)];
 static List<Color> sea = [Color(0xff61a3fe), Color(0xff63ffd5)];
 static List<Color> mango = [Color(0xffffa738), Color(0xffffe130)];
 static List<Color> fire =  [Color(0xffff5dcd), Color(0xffff8484)];

}