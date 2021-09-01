import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimacionesPage extends StatelessWidget {
  const AnimacionesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  

  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin{

  late AnimationController animationController;
  late Animation<double> rotacion;

  @override
  void initState() {

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4000),
    );
    rotacion = Tween(begin: 0.0,end: 2 * math.pi).animate( // Begin y end reciben datos en radianes
      // .animate(animationController); => Animaciones con velocidad constante
     CurvedAnimation(parent: animationController, curve: Curves.easeInOutBack) // Animaciones con velocidad dada por la Clase Curve
    );

    animationController.addListener(() {
      print('Status: ' + animationController.status.toString());
      if(animationController.status == AnimationStatus.completed){
        animationController.repeat();
      }
    });
    
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    animationController.forward(); // Forward = play

    return AnimatedBuilder(
      animation: animationController,
      child: null,
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: rotacion.value,
          child: _Rectangulo()
        ) ;
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Container(
       width: 70,
       height: 70,
       decoration: BoxDecoration(
         color: Colors.blue
       ),
     );
   }
}