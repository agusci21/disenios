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
  late Animation<double> opacidad;
  late Animation<double> moverDerecha;
  late Animation<double> agrandar;

  @override
  //AQUI en el initState, se definen y configyran las animaciones
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
     
      if(animationController.status == AnimationStatus.completed){
        animationController.reset();
      }
    });

    opacidad = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Interval(0, 0.25, curve: Curves.easeOut))
    );

    moverDerecha = Tween(begin: 0.0, end: 200.0).animate(animationController);

    agrandar = Tween(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.ease)
    );
    
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
      child: _Rectangulo(),
      builder: (BuildContext context, Widget? child) {
        return Transform.scale(
          scale: animationController.value,
          child: Transform.translate(
            offset: Offset(moverDerecha.value,0),
            child: Transform.rotate(
              angle: rotacion.value,
              child: Opacity(
                opacity: opacidad.value,
                child: child,
              )
            ),
          ),
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