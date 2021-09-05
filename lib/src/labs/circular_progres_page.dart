import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgresPage extends StatefulWidget {
  CircularProgresPage({Key? key}) : super(key: key);

  @override
  _CircularProgresPageState createState() => _CircularProgresPageState();
}

class _CircularProgresPageState extends State<CircularProgresPage> with SingleTickerProviderStateMixin {

  double porcentage = 0.0;
  double nuevoPorcentage = 0.0;
  late AnimationController controller;

  @override
  void initState() {
    
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 200));

    controller.addListener(() {


      setState(() {
      porcentage = lerpDouble(porcentage, nuevoPorcentage, controller.value) as double;
        
      });

      //print('Valor controller ${controller.value}');

    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          porcentage = nuevoPorcentage;
          nuevoPorcentage = porcentage + 5;
          if(nuevoPorcentage >= 100){
            nuevoPorcentage = 0;
            nuevoPorcentage = 0;
          }
            
          controller.forward(from: 0.0);
          setState(() {});

        },
        child: Icon(Icons.refresh),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5),
          height: 300,
          width: 300,
          child: CustomPaint(
            painter: _MiRadialProgress(porcentage),
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
