import 'package:disenios_01/src/pages/animaciones_page.dart';
import 'package:disenios_01/src/labs/circular_progres_page.dart';
import 'package:disenios_01/src/pages/animate_do_page.dart';
import 'package:disenios_01/src/pages/emergency_page.dart';
import 'package:disenios_01/src/pages/graficas_circulares_page.dart';
import 'package:disenios_01/src/pages/headres_page.dart';
import 'package:disenios_01/src/pages/launcher_page.dart';
import 'package:disenios_01/src/pages/slide_show_page.dart';
import 'package:disenios_01/src/pages/twitter_page.dart';
import 'package:disenios_01/src/retos/cuadrado_animado_retos.dart';
import 'package:flutter/material.dart';

import 'src/pages/navegacionPage.dart';
import 'src/pages/pinterest_page.dart';
import 'src/pages/slivers_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños app',
      initialRoute:'launcher' ,
      routes: {
        'headers'     : (_) => HeadersPage(),
        'animaciones' : (_) => AnimacionesPage(),
        'cuadradoAnimadoPage'   : (_) => CuadradoAnimadoRetos(),
        'circularProgressPage'  : (_) => CircularProgresPage(),
        'graficasCircularesPage': (_) => GraficasCircularesPage(),
        'slideShowPage' : (_) => SlideShowPage(),
        'pinterestPage' : (_) => PinterestPage(),
        'emergenyPage'  : (_) => EmergenyPage(),
        'sliverPage'    : (_) => SliverPage(),
        'animateDo1'    : (_) => AnimateDo1Page(),
        'twitter'       : (_) => TwitterPagePage(),
        'animacionPage' : (_) => NavegacionPage(),
        'launcher'      : (_) => LauncherPage(),
      },
    );
  }
}