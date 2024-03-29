import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  const ClockView({Key? key}) : super(key: key);

  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  late Timer timer;
  bool timerCancelled = false;

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 1), (timer){
      if (mounted) {setState(() {
      });
      }
      // print(timerCancelled); Debug Line
      if(timerCancelled){
        timer.cancel();
      }
    });
    super.initState();
  }

  @override
  void deactivate() {
    timerCancelled = true;
    timer.cancel();
    print(timerCancelled);
    super.deactivate();
  }

  @override
  void dispose() {
    timerCancelled = true;
    timer.cancel();
    print(timerCancelled);
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      width:  285,
      height: 275,
      child: Transform.rotate(
        angle: -pi/2,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}



class ClockPainter extends CustomPainter {

  var dateTime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width/2;
    var centerY = size.height/2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var fillBrush = Paint()
    ..color = Color(0xFF444974);

    var outlineBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..strokeWidth = 16
      ..style = PaintingStyle.stroke;

    var centerFillBrush = Paint()
      ..color = Color(0xFFEAECFF);

    var secHandBrush = Paint()
    ..color = Colors.orange.shade300
    ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
    ..strokeWidth = 6
    ;

    var minHandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xFF758EF6), Color(0xFF77DDFF)]).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8
    ;
    var hourHandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0XFFEA74AB), Color(0xFFc279fb)]).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10
    ;

    var dashBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2
    ;

    canvas.drawCircle(center, radius - 40, fillBrush);
    canvas.drawCircle(center, radius - 40 , outlineBrush);

    var hourHandX = centerX + 55 * cos((dateTime.hour * 30 +  dateTime.minute * 0.5) *pi/180);
    var hourHandY = centerX + 55 * sin((dateTime.hour * 30 +  dateTime.minute * 0.5) * pi/180);
    canvas.drawLine(center, Offset(hourHandX,hourHandY), hourHandBrush);


    var minHandX = centerX + 70.3 * cos(dateTime.minute * 6 * pi/180);
    var minHandY = centerX + 70.3 * sin(dateTime.minute * 6 * pi/180);
    canvas.drawLine(center, Offset(minHandX,minHandY), minHandBrush);

    var secHandX = centerX + 73.3 * cos(dateTime.second * 6 * pi/180);
    var secHandY = centerX + 73.3 * sin(dateTime.second * 6 * pi/180);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

    canvas.drawCircle(center, 16, centerFillBrush);

    var outerCircleRadius = radius;
    var innerCircleRadius = radius - 14;
    for (double i = 0; i < 360; i = i + 12){
      var x1 = centerX + outerCircleRadius * cos(i*pi/180);
      var y1 = centerX + outerCircleRadius * sin(i * pi/180);

      var x2 = centerX + innerCircleRadius * cos(i * pi/180);
      var y2 = centerX + innerCircleRadius * sin(i * pi/180);


      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }

  }

  @override
  bool shouldRepaint( CustomPainter oldDelegate) {
    return true;
  }

}
