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
       child: Text('${widget.porcentaje}'),
    );
  }
}