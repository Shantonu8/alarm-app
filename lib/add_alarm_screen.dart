import 'package:flutter/material.dart';
import 'package:weather_alarm_app/constants/custom_app_bar.dart';


late TimeOfDay time;

class AddAlarmScreen extends StatefulWidget {
  const AddAlarmScreen({Key? key}) : super(key: key);
  @override
  _AddAlarmScreenState createState() => _AddAlarmScreenState();
}

class _AddAlarmScreenState extends State<AddAlarmScreen> {

  late String DateText = 'Set date';
  late DateTime date = DateTime.now();

  String getDate(){
    if (date == null) return 'Select Date';
    else{
      return "${date.day}/${date.month}/${date.year}";
    }
  }




  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(context: context, initialDate: initialDate, firstDate: DateTime(DateTime.now().year), lastDate: DateTime(DateTime.now().year + 5));

    if(newDate == null) return;
    if(newDate.isBefore(DateTime.now()))
    {
      return;
    }
    setState(() {
      date = newDate;
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
      backgroundColor: Color(0xff2E2E42),
      appBar: PreferredSize(preferredSize: Size.fromHeight(50),
          child: CustomAppBar("Add Alarm")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 42.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(onPressed: (){pickDate(context);},
              child: Row(
                children: [
                  Text(getDate(), style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),),
                ],
              ),)
          ],
        ),
      ),
    );
  }
}









