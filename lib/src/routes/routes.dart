import 'package:disenios_01/src/pages/animate_do_page.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:disenios_01/src/pages/animaciones_page.dart';
import 'package:disenios_01/src/pages/emergency_page.dart';
import 'package:disenios_01/src/pages/graficas_circulares_page.dart';
import 'package:disenios_01/src/pages/headres_page.dart';
import 'package:disenios_01/src/pages/pinterest_page.dart';
import 'package:disenios_01/src/pages/slide_show_page.dart';

final pageRoutes = <_Routes> [
  _Routes(FontAwesomeIcons.slideshare, 'SlideShow', SlideShowPage()),
  _Routes(FontAwesomeIcons.ambulance, 'Emergencia', EmergenyPage()),
  _Routes(FontAwesomeIcons.heading, 'Encabezados', HeadersPage()),
  _Routes(FontAwesomeIcons.peopleCarry, 'Cuadro Animado', AnimacionesPage()),
  _Routes(FontAwesomeIcons.circleNotch, 'Circulo de Progreso', GraficasCircularesPage()),
  _Routes(FontAwesomeIcons.pinterest, 'Pinterest', PinterestPage()),
  _Routes(FontAwesomeIcons.mobile, 'Slivers', SlideShowPage()),
  _Routes(FontAwesomeIcons.adjust, 'Animations', AnimateDo1Page()),
];

class _Routes{

  final IconData icon;
  final String titulo;
  final Widget page;

  _Routes(this.icon, this.titulo, this.page);

}