import 'package:flutter/material.dart';

class CustomTextStyle{
  static TextStyle customTextStyle ( int size) {
    return TextStyle(
      fontSize: size.toDouble(),
      fontFamily: 'avenir',
      color: Colors.white,
    );
  }
}