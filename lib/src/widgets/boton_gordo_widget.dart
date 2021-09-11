import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGordo extends StatelessWidget {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;
  final Function onPressed;

  const BotonGordo({
    required this.icon,
    this.texto = '',
    this.color1 = Colors.grey,
    this.color2 = Colors.blueGrey,
    required this.onPressed
  }) ;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _BotonGordoBackground(
          color1: this.color1,
          color2: this.color2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 140, width: 40,),
            FaIcon(this.icon, color: Colors.white, size: 40,),
            Expanded(child: Text(this.texto, style: TextStyle(color: Colors.white,fontSize: 18),)),
            FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white,),
            SizedBox(width: 40,)
          ],
        )
      ],
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {

  final Color color1;
  final Color color2;

  const _BotonGordoBackground({
    required this.color1,
    required this.color2,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.2),offset: Offset(4, 6), blurRadius: 10)
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
           this.color1,
           this.color2,
          ]
        )
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(right: -20,top: -20,child: FaIcon(FontAwesomeIcons.carCrash, size: 150,color: Colors.white.withOpacity(0.2),),)
          ],
        ),
      ),
    );
  }
}