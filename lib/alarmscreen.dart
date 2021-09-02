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
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex, onTap: (i) {
        setState(() {
          _currentIndex = i;
        });
        if (i == 0 ) {
          Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
        }
        if(i == 1 ){

        }

      },
        items: [
          SalomonBottomBarItem(icon: Icon(Icons.home), title: Text("Home"), selectedColor: Colors.pink, unselectedColor: Colors.white),
          SalomonBottomBarItem(icon: Icon(Icons.add), title: Text("Alarm"), selectedColor: Colors.yellow, unselectedColor: Colors.white),
          SalomonBottomBarItem(icon: Icon(Icons.timer), title: Text("Stopwatch"), selectedColor: Colors.orange, unselectedColor: Colors.white),
          SalomonBottomBarItem(icon: Icon(Icons.watch), title: Text("Timer"), selectedColor: Colors.cyan, unselectedColor: Colors.white)
        ],
      ),
    );
  }
}
