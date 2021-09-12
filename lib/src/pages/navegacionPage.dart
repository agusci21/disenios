import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class NavegacionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Notifications Page'),
      ),

      floatingActionButton: _BotonFlotante(),

      bottomNavigationBar: _BottomNavigation(),

      //body: ,
   );
  }
}

class _BotonFlotante extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.pink,
      onPressed: (){}, 
      child: FaIcon(FontAwesomeIcons.play),
    );
  }
}

class _BottomNavigation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [

        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.bone),
          label: 'Bones'
        ),

        BottomNavigationBarItem(
          icon: Stack(
            children: [
              FaIcon(FontAwesomeIcons.bell),
              Positioned(
                right: -1,
                //child: Icon(Icons.brightness_1, size: 12, color: Colors.pink,)
                child: Container(
                  alignment: Alignment.center,
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    shape: BoxShape.circle
                  ),
                  child: Text('1', style: TextStyle(color: Colors.white, fontSize: 15),),
                ),
              )
            ],
          ),
          label: 'Notifications'
        ),

        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.dog),
          label: 'My Dog'
        ),

      ],
    );
  }
}