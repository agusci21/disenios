import 'package:disenios_01/src/widgets/radials_progress_widget.dart';
import 'package:flutter/material.dart';

class GraficasCircularesPage extends StatefulWidget {
  const GraficasCircularesPage({Key? key}) : super(key: key);

  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {

 late double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: (){
          setState(() {
            porcentaje+=10;
            if(porcentaje > 100){
              porcentaje = 0;
            }

          });
        },
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: RadialProgress(porcentaje: porcentaje,),
        )
      ),
    );
  }
}