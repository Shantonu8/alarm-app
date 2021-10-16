import 'package:flutter/material.dart';

class CustomBoxDecoration{

  static BoxDecoration customBoxDecoration(){
    return BoxDecoration(
      color: Color(0xff4f5275),
      borderRadius: BorderRadius.circular(25),
      border: Border.all(color: Colors.white, width: 2),
    );

}
}