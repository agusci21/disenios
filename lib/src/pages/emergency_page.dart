import 'package:disenios_01/src/widgets/headers_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class EmergenyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IconHeader(
        icon: FontAwesomeIcons.plus,
        titulo: 'Asistencia medica',
        subtitulo: 'Haz solicitado',
        color1: Color(0xff526bf6),
        color2: Color(0xff67ACF2),

      )
   );
  }
}