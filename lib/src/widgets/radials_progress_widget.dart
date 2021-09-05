import 'dart:math' as math;
import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double porcentaje;
  RadialProgress({Key? key, required this.porcentaje}) : super(key: key);

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _MiRadialProgress(widget.porcentaje),
      )
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

    var pi = math.pi;
    double arcAngle = 2 * pi * (porcentage/100);
    canvas.drawArc(
      Rect.fromCircle(center: centro, radius: radio),
      -math.pi * 0.5,
      arcAngle,
      false,
      paint
    );

  }


}
