import 'dart:math' as math;

import 'package:flutter/material.dart';

class CircularProgresPage extends StatefulWidget {
  CircularProgresPage({Key? key}) : super(key: key);

  @override
  _CircularProgresPageState createState() => _CircularProgresPageState();
}

class _CircularProgresPageState extends State<CircularProgresPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5),
          height: 300,
          width: 300,
          child: CustomPaint(
            painter: _MiRadialProgress(60),
          ),
        ),
      ),
    );
  }
}

class _MiRadialProgress extends CustomPainter{

  final porcentage;

  _MiRadialProgress(this.porcentage);

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  @override
  void paint(Canvas canvas, Size size) {

    //Circulo completado
    
    final paint = new Paint();
    
    paint.strokeWidth = 5;
    paint.color = Colors.black;
    paint.style  = PaintingStyle.stroke;

    final x = size.width;
    final y = size.height;
    final radio = math.min(x * 0.5, y * 0.5);

    final centro = Offset(x * 0.5, y * 0.5);

    canvas.drawCircle(centro, radio, paint);

    //Arco
    final paintArco = new Paint();
    
    paint.strokeWidth = 10;
    paint.color = Colors.pink;
    paint.style  = PaintingStyle.stroke;

    double arcAngle = 2* math.pi * (porcentage/100);
    canvas.drawArc(
      Rect.fromCircle(center: centro, radius: radio),
      -math.pi * 0.5,
      arcAngle,
      false,
      paint
    );

  }


}
