import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class TwitterPagePage extends StatefulWidget {


  @override
  _TwitterPagePageState createState() => _TwitterPagePageState();
}

class _TwitterPagePageState extends State<TwitterPagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: FaIcon(FontAwesomeIcons.play),
        onPressed: (){},
      ),
      backgroundColor: Color(0xff1DA1F2),
      body: Center(
        child: ZoomOut(
          duration: Duration(milliseconds: 1000),
          from: 30,
          child: FaIcon(FontAwesomeIcons.twitter, color: Colors.white, size: 40,)
      ),
     ),
   );
  }
}