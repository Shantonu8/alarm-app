import 'package:flutter/material.dart';
import 'package:weather_alarm_app/add_alarm_screen.dart';
import 'constants/custom_app_bar.dart';
import 'data/data.dart';
import 'package:dotted_border/dotted_border.dart';
import 'alarm_helper.dart';
import 'models/alarm_info.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  _AlarmScreenState createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {

  AlarmHelper _alarmHelper = AlarmHelper();
  Future<List<AlarmInfo>>? _alarms;

  @override
  void initState() {
    _alarmHelper.initializeDatabase().then((value) => print('------------dB initialized'));
    _alarms = _alarmHelper.getAlarm();
    super.initState();
  }

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
              child: FutureBuilder<List<AlarmInfo>>(
                future: _alarms,
                builder: (context, snapshot)
                {
                  if(snapshot.hasData){
                  return ListView(
                    children: snapshot.data!.map<Widget>((alarms) {
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
                                Text(alarms.title, style: TextStyle(color:
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
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return AddAlarmScreen();
                          }));
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
                  );}
                  else{
                    return Center(
                      child: Text('Loading...', style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),),
                    );
                  }
                
                }
              ),
            ),
          ),
        ],
      )
    );
  }
}







