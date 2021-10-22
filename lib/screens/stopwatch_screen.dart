import 'package:flutter/material.dart';

import 'dart:async';

import 'package:weather_alarm_app/constants/custom_app_bar.dart';
import 'package:weather_alarm_app/constants/text_style.dart';
import 'package:weather_alarm_app/constants/custom_container.dart';



class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({Key? key}) : super(key: key);

  @override
  _StopwatchScreenState createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  static double height = 120;
  static double width = 110;


  bool flag  = true;
  late Stream<int>? timerStream;
  late StreamSubscription <int> timeSubscription;
  String hour = '00';
  String minute = '00';
  String seconds = '00';

  String? previousHour;
  String? previousMinute;
  String? previousSeconds;



  Stream<int> stopWatchStream(){
    StreamController<int>? streamController;
    Timer? timer;
    Duration timeInterval = Duration(seconds: 1);
    int counter = 0;

    void stopTimer(){
      if (timer != null){
        timer?.cancel();
        timer = null;
        counter = 0;
        streamController?.close();
      }
    }


    void tick(_) {
      counter++;
      streamController?.add(counter);
      if(!flag){
        stopTimer();
      }
    }

    void startTimer(){
      timer = Timer.periodic(timeInterval, tick);
    }

    streamController = StreamController<int>(
      onListen:  startTimer,
      onCancel: stopTimer,
      onResume: startTimer,
      onPause: stopTimer,
    );


    return streamController.stream;

  }


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
                Column(
                  children: [
                    CustomContainer(width: width, height: height, time: hour).customContainer(),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Hours', style: CustomTextStyle.customTextStyle(20),)
                  ],
                ),
                Column(
                  children: [
                    CustomContainer(width: width, height: height, time: minute).customContainer(),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Minutes', style: CustomTextStyle.customTextStyle(20),)
                  ],
                ),
                Column(
                  children: [
                    CustomContainer(width: width, height: height, time: seconds).customContainer(),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Seconds', style: CustomTextStyle.customTextStyle(20),)
                  ],
                ),

              ],
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              children: [
                MaterialButton(onPressed: () {

                    timerStream = stopWatchStream();
                    timeSubscription = timerStream!.listen((int newTick) {
                      setState(() {
                        hour = '00';
                        minute = '00';
                        seconds = '00';

                        hour = ((newTick / (60 * 60)) % 60)
                            .floor()
                            .toString()
                            .padLeft(2, '0');
                        minute = ((newTick / 60) % 60)
                            .floor()
                            .toString()
                            .padLeft(2, '0');
                        seconds =
                            (newTick % 60).floor().toString().padLeft(2, '0');
                      });
                    });
                  }

                ,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(60, 15, 60, 15),
                    child: Text('Start', style: CustomTextStyle.customTextStyle(20),),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xff3D4069),
                      // border: Border.all(color: Colors.white)
                    ),
                  ),
                ),
                MaterialButton(onPressed: () {
                  timeSubscription.cancel();
                  timerStream = null;
                },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(60, 15, 60, 15),
                    child: Text('Stop', style: CustomTextStyle.customTextStyle(20),),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xff3D4069),
                      // border: Border.all(color: Colors.white)
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}



