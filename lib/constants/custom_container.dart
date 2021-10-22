import 'package:flutter/material.dart';
import 'package:weather_alarm_app/constants/text_style.dart';

import 'container_decoration.dart';

class CustomContainer {

  double height;
  double width;
  String time = '00';

  CustomContainer({required this.width, required this.height, required this.time});


  Container customContainer(){
    return  Container(
      decoration: CustomBoxDecoration.customBoxDecoration(),
      height: height,
      width: width,
      child: Center(
        child: Text(
          time, style: CustomTextStyle.customTextStyle(50),
        ),
      ),
    );
  }
}