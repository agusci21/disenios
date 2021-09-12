import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


class NavegacionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationService(),
      child: Scaffold(
    
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text('Notifications Page'),
        ),
    
        floatingActionButton: _BotonFlotante(),
    
        bottomNavigationBar: _BottomNavigation(),
    
        //body: ,
       ),
    );
  }
}

class _BotonFlotante extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return FloatingActionButton(
      backgroundColor: Colors.pink,
      onPressed: (){
        int numero = Provider.of<_NotificationService>(context, listen: false).numero;
        numero++;
        Provider.of<_NotificationService>(context, listen: false).numero = numero;
      }, 
      child: FaIcon(FontAwesomeIcons.play),
    );
  }
}

class _BottomNavigation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

  final int numero = Provider.of<_NotificationService>(context).numero;
    
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
                  child: Text('$numero', style: TextStyle(color: Colors.white, fontSize: 15),),
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

class _NotificationService extends ChangeNotifier{

  int _numero = 0;
  int get numero => this._numero;
  set numero (int value){
    this._numero = value;
    notifyListeners();
  }

}