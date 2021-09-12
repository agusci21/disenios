import 'package:animate_do/animate_do.dart';
import 'package:disenios_01/src/pages/twitter_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class AnimateDo1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      delay: Duration(microseconds: 500),
      child: Scaffold(
    
        appBar: AppBar(
          title: Text('Animate_do'),
          actions: [
            IconButton(onPressed: (){
              Navigator.pushReplacement(context, CupertinoPageRoute(builder: (BuildContext context) => TwitterPagePage()));
            }, icon: FaIcon(FontAwesomeIcons.twitter)),
            IconButton(onPressed: (){}, icon: Icon(Icons.navigate_next))
          ],
    
        ),
    
        floatingActionButton: BounceInRight(
          child: FloatingActionButton(
            child: FaIcon(FontAwesomeIcons.play),
            onPressed: (){
              Navigator.pushReplacement(context, CupertinoPageRoute(builder: (BuildContext context) => AnimateDo1Page()));
            },
          ),
        ),
    
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
    
              ElasticIn(
                delay: Duration(milliseconds: 2500),
                child: Icon(Icons.new_releases, color: Colors.blue, size: 40,),
              ),
    
              FadeInDown(
                child: Text('Titulo',style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200),),
                delay: Duration(milliseconds: 1000),
                duration: Duration(milliseconds: 1500),
              ),
    
              FadeInDown(
                child: Text('Texto Pequeño',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),),
                delay: Duration(milliseconds: 2000),
                duration: Duration(milliseconds: 1500),
              ),
    
              FadeInLeft(
                delay: Duration(milliseconds:1100),
                child: Container(width: 220,height: 1.5,color: Colors.blue,),
              )
    
    
            ],
          ),
        )
       ),
    );
  }
}