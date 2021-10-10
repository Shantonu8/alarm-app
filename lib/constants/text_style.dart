import 'package:flutter/material.dart';

class CustomTextStyle{
  CustomTextStyle(int i);

  static TextStyle customTextStyle ( int size) {
    return TextStyle(
      fontSize: size.toDouble(),
      fontFamily: 'avenir',
      color: Colors.white,
    );
  }
}