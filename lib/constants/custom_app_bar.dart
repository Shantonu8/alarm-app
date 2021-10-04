import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
CustomAppBar(this.title);


final String title;

@override
Widget build(BuildContext context) {
  return AppBar(
    title: Padding(
      padding: const EdgeInsets.only(left: 42.0),
      child: Text(title, style: TextStyle(
          fontSize: 20
      ),),
    ),
    elevation: 0,
    backgroundColor:  Color(0xFF2D2F41),
  );
}
}
