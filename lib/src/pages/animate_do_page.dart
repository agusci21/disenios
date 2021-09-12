import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class AnimateDo1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Animate_do'),
        actions: [
          IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.twitter)),
          IconButton(onPressed: (){}, icon: Icon(Icons.navigate_next))
        ],

      ),

      floatingActionButton: FloatingActionButton(
        child: FaIcon(FontAwesomeIcons.play),
        onPressed: (){},
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(Icons.new_releases, color: Colors.blue, size: 40,),

            Text('Titulo',style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200),),

            Text('Texto Pequeño',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),),

            Container(width: 220,height: 1.5,color: Colors.blue,)


          ],
        ),
      )
   );
  }
}