import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show Alignment, BorderRadius, BoxDecoration, BoxShadow, Color, CrossAxisAlignment, EdgeInsets, FontWeight, LinearGradient, MainAxisAlignment, Offset, Radius, Size, TextStyle;
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:weather_alarm_app/main.dart';
import 'constants/custom_app_bar.dart';
import 'data/data.dart';
import 'package:dotted_border/dotted_border.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  _AlarmScreenState createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      appBar: PreferredSize(preferredSize: Size.fromHeight(50),
          child: CustomAppBar("Alarm")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 45, vertical: 10),
              child: ListView(
              children: alarms.map<Widget>((alarms) {
                return Container(
                  margin: EdgeInsets.only(bottom: 32),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.label, color: Colors.white, size:
                              24,),
                              SizedBox(width: 8,),
                              Text('Office', style: TextStyle(color:
                              Colors.white, fontFamily: 'avenir'),),
                            ],
                          ),
                          Switch(value: true, onChanged: (bool value){},
                            activeColor: Colors.white,)
                        ],
                      ),
                      Text('Mon-Fri', style: TextStyle(color:
                      Colors.white, fontFamily: 'avenir'),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('07:00 AM', style: TextStyle(color:
                          Colors.white, fontFamily: 'avenir',
                              fontWeight: FontWeight.w700,
                              fontSize: 24),),
                          Icon(Icons.keyboard_arrow_down,size: 36,
                            color: Colors.white,)
                        ],
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors:  GradientColors.sunset,
                        begin: Alignment.centerLeft,
                      end: Alignment.centerRight
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    boxShadow: [
                      BoxShadow(
                        color: GradientColors.sunset.last.withOpacity(0.4),
                          blurRadius: 5, spreadRadius: 2, offset: Offset(4,4)
                      )
                    ]
                  ),
                );
              }).followedBy([
                DottedBorder(
                  child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff3C3F69),
                        borderRadius: BorderRadius.all(Radius.circular(24))
                    ),
                  alignment: Alignment.center,
                    // color: Colors.red,
                    height: 110,
                    child: MaterialButton(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Icon(Icons.control_point, color: Colors.white,
                            size: 30,),
                          SizedBox(height: 8,),
                          Center(
                            child: Text('Add Alarm', style: TextStyle(
                              fontSize: 15, fontFamily: 'avenir',
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                            ),),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      onPressed: (){
                        showModalBottomSheet(context: context, builder: (context){
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Column(
                              children: [
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Text("Add Alarm", style: TextStyle(
                                      fontFamily: 'avenir',
                                      fontSize: 20,

                                    ),),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Set time', style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 20
                                      ),
                                      ),
                                      IconButton(onPressed: (){}, icon: Icon(
                                        Icons.keyboard_arrow_right
                                      ),
                                      )
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  )
                                )
                              ],
                            ),
                          );
                        },
                        );


                        // scheduleAlarm();
                      },
                    ),
                  ),
                  strokeWidth: 3,
                  color: Colors.white,
                  borderType: BorderType.RRect,
                  radius: Radius.circular(24),
                  dashPattern: [6, 6, 6],
                ),
              ]).toList(),
    ),
            ),
          ),
        ],
      )
    );
  }
}


void scheduleAlarm ()  async{
  var scheduleNotificationDateTime = DateTime.now().add(Duration(seconds: 10));
  var androidPlatformChannelSpecifics = AndroidNotificationDetails('alarm_notif', 'alarm_notif', 'Channel for Alarm Notification', icon: 'clock', sound: RawResourceAndroidNotificationSound('sound'), largeIcon: DrawableResourceAndroidBitmap('clock'));

  var iOSPlatformChannelSpecifics = IOSNotificationDetails(
    sound: '',
    presentAlert: true,
    presentBadge: true,
    presentSound: true
  );
  var platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics); await flutterLocalNotificationsPlugin.schedule(0, 'Office', 'Time for Office! Good Morning', scheduleNotificationDateTime, platformChannelSpecifics);
}


