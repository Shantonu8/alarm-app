import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.add),
            label: "Alarm",
          ),
          NavigationDestination(
            icon: Icon(Icons.timer),
            label: "Stopwatch",
          ),
          NavigationDestination(
            icon: Icon(Icons.watch),
            label: "Timer",
          )

        ],
      ),
    );
  }
}
