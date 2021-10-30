import 'package:flutter/material.dart';
import 'package:weather_alarm_app/databases/alarm_helper.dart';
import 'package:weather_alarm_app/constants/custom_app_bar.dart';
import 'package:flash/flash.dart';
import 'package:weather_alarm_app/constants/text_style.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:weather_alarm_app/main.dart';
import 'package:weather_alarm_app/models/alarm_info.dart';
import '../constants/custom_app_bar.dart';
import '../data/data.dart';
import '../constants/text_style.dart';


late String DateText = 'Set date';
late DateTime date = DateTime.now();
late TimeOfDay time = TimeOfDay.now();
late String title;



class AddAlarmScreen extends StatefulWidget {
  const AddAlarmScreen({Key? key}) : super(key: key);
  @override
  _AddAlarmScreenState createState() => _AddAlarmScreenState();
}

class _AddAlarmScreenState extends State<AddAlarmScreen> {

  AlarmHelper _alarmHelper = AlarmHelper();

  @override
  void dispose() {
    super.dispose();
  }


  @override
  void initState() {
    print(DateTime.now());
    super.initState();
  }
  

  // Methods
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
    String? text,
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
            content: Center(child: Text(text!)),
          ),
        );
      },
    );
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(context: context, initialDate: date == null ? initialDate : date, firstDate: DateTime(DateTime.now().year), lastDate: DateTime(DateTime.now().year + 5));

    if(newDate == null) return;
    if(newDate.isBefore(DateTime.now()))
    {
      showErrorDateFlash(duration: Duration(seconds: 10), text: 'Date Invalid. Please try again!');
      return;
    }
    setState(() {
      date = newDate;
    });
  }

  Future pickTime(BuildContext context) async {
    final newTime = await showTimePicker(context: context, initialTime: time == null ? TimeOfDay.now() :  time);

    if(newTime == null) return;
    setState(() {
      time = newTime;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async{
        DateTime finalDateTime =  DateTime(date.year, date.month, date.day, time.hour, time.minute);
        if(title == null){
          showErrorDateFlash(duration: Duration(seconds: 10), text: 'Add a title');
          return;
        }
        var alarmInfo  = AlarmInfo( title: title, dateTime: finalDateTime, gradientColorIndex: alarms.length, id: alarms.length, isPending: 0);
        _alarmHelper.insetAlarm(alarmInfo);
        Navigator.pop(context);
      }, child: Icon(Icons.check,),),
      backgroundColor: Color(0xff2E2E42),
      appBar: PreferredSize(preferredSize: Size.fromHeight(50),
          child: CustomAppBar("Add Alarm")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 42.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Enter title for the Alarm:', style: CustomTextStyle.customTextStyle(20),),
            TextField(
              onChanged: (text){
                title = text;
              },
              style: CustomTextStyle.customTextStyle(15),
            ),
            MaterialButton(onPressed: (){pickDate(context);},
              padding: EdgeInsets.zero,
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
              padding: EdgeInsets.zero,
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


void scheduleAlarm (String title)  async{
  var scheduleNotificationDateTime = DateTime(date.year, date.month, date.day, time.hour, time.minute);
  var androidPlatformChannelSpecifics = AndroidNotificationDetails('alarm_notif', 'alarm_notif', 'Channel for Alarm Notification', icon: 'clock', sound: RawResourceAndroidNotificationSound('sound'), largeIcon: DrawableResourceAndroidBitmap('clock'));

  var iOSPlatformChannelSpecifics = IOSNotificationDetails(
      sound: '', // Developing on Windows hence playing another sound for IOS devices is not possible
      presentAlert: true,
      presentBadge: true,
      presentSound: true
  );
  var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics); await flutterLocalNotificationsPlugin.schedule(0, title, 'Alarm Ringing', scheduleNotificationDateTime, platformChannelSpecifics);

}





