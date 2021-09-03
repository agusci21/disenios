import 'package:disenios_01/src/pages/animaciones_page.dart';
import 'package:disenios_01/src/pages/circular_progres_page.dart';
import 'package:disenios_01/src/pages/headres_page.dart';
import 'package:disenios_01/src/retos/cuadrado_animado_retos.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños app',
      initialRoute:'circularProgressPage' ,
      routes: {
        'headers'     : (_) => HeadersPage(),
        'animaciones' : (_) => AnimacionesPage(),
        'cuadradoAnimadoPage'  : (_) => CuadradoAnimadoRetos(),
        'circularProgressPage' : (_) => CircularProgresPage()
      },
    );
  }
}