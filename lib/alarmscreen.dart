import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';



class AlarmScreen extends StatefulWidget {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  _AlarmScreenState createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  var _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 45.0),
          child: Text("Clock", style: TextStyle(
              fontSize: 20
          ),),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor:  Color(0xFF2D2F41),
      ),

    );
  }
}
