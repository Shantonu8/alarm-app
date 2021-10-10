import 'package:flutter/material.dart';
import 'package:weather_alarm_app/constants/custom_app_bar.dart';
import 'package:flash/flash.dart';
import 'package:weather_alarm_app/constants/text_style.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/rendering.dart' show Alignment, BorderRadius, BoxDecoration, BoxShadow, Color, CrossAxisAlignment, EdgeInsets, FontWeight, LinearGradient, MainAxisAlignment, Offset, Radius, Size, TextStyle;
import 'package:flutter/widgets.dart';
import 'package:weather_alarm_app/main.dart';
import 'constants/custom_app_bar.dart';


late String DateText = 'Set date';
late DateTime date = DateTime.now();
late TimeOfDay time = TimeOfDay.now();




class AddAlarmScreen extends StatefulWidget {
  const AddAlarmScreen({Key? key}) : super(key: key);
  @override
  _AddAlarmScreenState createState() => _AddAlarmScreenState();
}

class _AddAlarmScreenState extends State<AddAlarmScreen> {



  String getDate(){
    if (date == null) return 'Select Date';
    else{
      return "${date.day}/${date.month}/${date.year}";
    }
  }
  String getTime(){
    if (time == null) return 'Select Time';
    else{
      var minute  = time.minute.toString().padLeft(2, '0');
      var hour  = time.hour.toString().padLeft(2, '0');
      return "$hour:$minute";
    }
  }


  void showErrorDateFlash({
    Duration? duration,
    flashStyle = FlashBehavior.floating,
  }) {
    showFlash(
      context: context,
      duration: duration,
      builder: (context, controller) {
        return Flash(
          controller: controller,
          behavior: flashStyle,
          position: FlashPosition.bottom,
          boxShadows: kElevationToShadow[4],
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          child: FlashBar(
            content: Center(child: Text('Date invalid. Please try again!')),
          ),
        );
      },
    );
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(context: context, initialDate: initialDate, firstDate: DateTime(DateTime.now().year), lastDate: DateTime(DateTime.now().year + 5));

    if(newDate == null) return;
    if(newDate.isBefore(DateTime.now()))
    {
      showErrorDateFlash();
      return;
    }
    setState(() {
      date = newDate;
    });
  }

  Future pickTime(BuildContext context) async {
    final newTime = await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if(newTime == null) return;
    setState(() {
      time = newTime;
    });
  }

@override
  void initState() {
    print(DateTime.now());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
      }, child: Icon(Icons.add,),),
      backgroundColor: Color(0xff2E2E42),
      appBar: PreferredSize(preferredSize: Size.fromHeight(50),
          child: CustomAppBar("Add Alarm")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 42.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            MaterialButton(onPressed: (){pickDate(context);},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Select Date:', style: CustomTextStyle.customTextStyle(20),),
                  Center(
                    child: Text(getDate(), style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),),
                  ),
                ],
              ),),
            MaterialButton(onPressed: (){pickTime(context);},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Select Time:', style: CustomTextStyle.customTextStyle(20),),
                  Center(
                    child: Text(getTime(), style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),),
                  ),
                ],
              ),)
          ],
        ),
      ),
    );
  }
}





void scheduleAlarm ()  async{
  var scheduleNotificationDateTime = DateTime(date.year, date.month, date.day, time.hour, time.minute);
  var androidPlatformChannelSpecifics = AndroidNotificationDetails('alarm_notif', 'alarm_notif', 'Channel for Alarm Notification', icon: 'clock', sound: RawResourceAndroidNotificationSound('sound'), largeIcon: DrawableResourceAndroidBitmap('clock'));

  var iOSPlatformChannelSpecifics = IOSNotificationDetails(
      sound: '', // Developing on Windows hence playing another sound for IOS devices is not possible
      presentAlert: true,
      presentBadge: true,
      presentSound: true
  );
  var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics); await flutterLocalNotificationsPlugin.schedule(0, 'Office', 'Time for Office! Good Morning', scheduleNotificationDateTime, platformChannelSpecifics);
}





