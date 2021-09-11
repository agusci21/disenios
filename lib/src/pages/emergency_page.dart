import 'package:animate_do/animate_do.dart';
import 'package:disenios_01/src/widgets/boton_gordo_widget.dart';
import 'package:disenios_01/src/widgets/headers_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class _ItemBoton {

  late final IconData? icon;
  late final String? texto;
  late final Color? color1;
  late final Color? color2;

  _ItemBoton( this.icon, this.texto, this.color1, this.color2 );
}




class EmergenyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    final items = <_ItemBoton>[
     _ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
     _ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
     _ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
     _ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
     _ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
     _ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
     _ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
     _ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
     _ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
     _ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
     _ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
     _ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
    ];

    // FERNANDO WAY

    List<Widget> itemMap = items.map(
      (item) => FadeInLeft(
        duration: Duration(milliseconds: 250),
        child: BotonGordo(
          icon: item.icon as IconData,
          texto: item.texto as String,
          color1: item.color1 as Color,
          color2: item.color2 as Color,
          onPressed: (){}),
      )
    ).toList();

    // MY WAY

    // List<Widget> itemMap = List.generate(items.length, (index) =>
    //   BotonGordo(
    //     onPressed: (){},
    //     icon: items[index].icon as IconData,
    //     texto: items[index].texto as String,
    //     color1: items[index].color1 as Color,
    //     color2: items[index].color2 as Color,
    //   ));

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 270),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: itemMap
            ),
          ),
          _Encabezado()
        ],
      ),
   );
  }
}

class _Encabezado extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
          icon: FontAwesomeIcons.plus, titulo: 'Assistencia medica'
        ),
        Positioned(
          top: 30,
          right: 0,
          child: IconButton(
            onPressed: (){},
            icon: FaIcon(FontAwesomeIcons.ellipsisV, color: Colors.white,size: 35,)
          )
        )
      ],
    );
  }
}

class BotonGordoTemp extends StatelessWidget {
  const BotonGordoTemp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BotonGordo(
      icon: FontAwesomeIcons.carCrash,
      onPressed: (){},
      color1: Colors.black,
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plus,
      titulo: 'Asistencia medica',
      subtitulo: 'Haz solicitado',
      color1: Color(0xff526bf6),
      color2: Color(0xff67ACF2),

    );
  }
}