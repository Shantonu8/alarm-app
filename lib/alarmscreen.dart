import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/rendering.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:weather_alarm_app/main.dart';
import 'constants/custom_app_bar.dart';
import 'data/data.dart';

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
              padding: EdgeInsets.symmetric(horizontal: 45),
              child: ListView(
              children: alarms.map((alarms) {
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
                      colors: alarms.gradientColors,
                        begin: Alignment.centerLeft,
                      end: Alignment.centerRight
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    boxShadow: [
                      BoxShadow(
                        color: alarms.gradientColors.last.withOpacity(0.4),
                          blurRadius: 5, spreadRadius: 2, offset: Offset(4,4)
                      )
                    ]
                  ),
                );
              }).followedBy([
                Container(
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
                      scheduleAlarm();
                    },
                  ),
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
