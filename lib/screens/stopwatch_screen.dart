import 'package:flutter/material.dart';
import 'package:weather_alarm_app/constants/container_decoration.dart';
import 'dart:async';

import 'package:weather_alarm_app/constants/custom_app_bar.dart';
import 'package:weather_alarm_app/constants/text_style.dart';



class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({Key? key}) : super(key: key);

  @override
  _StopwatchScreenState createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  static double height = 150;
  static double width = 110;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(50),
      child: CustomAppBar('Stopwatch')),
      backgroundColor: Color(0xFF2D2F41),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: CustomBoxDecoration.customBoxDecoration(),
                  height: height,
                  width: width,
                  child: Center(
                    child: Text(
                      '00', style: CustomTextStyle.customTextStyle(20),
                    ),
                  ),
                ),
                Container(
                  decoration: CustomBoxDecoration.customBoxDecoration(),
                  height: height,
                  width: width,
                  child: Center(
                    child: Text(
                      '00', style: CustomTextStyle.customTextStyle(20),
                    ),
                  ),
                ),
                Container(
                  decoration: CustomBoxDecoration.customBoxDecoration(),
                  height: height,
                  width: width,
                  child: Center(
                    child: Text(
                      '00', style: CustomTextStyle.customTextStyle(20),
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(
              height: 100,
            ),
            MaterialButton(onPressed: (){},
              child: Container(
                padding: EdgeInsets.fromLTRB(60, 15, 60, 15),
                child: Text('Start', style: CustomTextStyle.customTextStyle(20),),
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(10),
                  color: Color(0xff3D4069),
                ),
              ),
              
            

            )
          ],
        ),
      ),
    );
  }
}
