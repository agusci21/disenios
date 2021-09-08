
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton{
  var onPressed;
  final IconData icon;

  PinterestButton({required this.onPressed, required this.icon});
}

class PinterestMenu extends StatelessWidget {

  final bool mostrar;

  final Color backGroundColor;
  final Color activeColor; 
  final Color inactiveColor; 

   PinterestMenu({
    this.mostrar = true,
    this.backGroundColor = Colors.white,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.blueGrey
  });
  
  final List<PinterestButton> items = [
    PinterestButton(onPressed: (){print('pie_chart');}, icon: Icons.pie_chart),
    PinterestButton(onPressed: (){print('search');}, icon: Icons.search),
    PinterestButton(onPressed: (){print('notifications');}, icon: Icons.notifications),
    PinterestButton(onPressed: (){print('supervised_user_circle');}, icon: Icons.supervised_user_circle),
  ];



  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        opacity: (mostrar) ? 1 : 0,
        child: Builder(
          builder: (BuildContext context) {
            Provider.of<_MenuModel>(context).backGroundColor = this.backGroundColor;
            Provider.of<_MenuModel>(context).activeColor = this.activeColor;
            Provider.of<_MenuModel>(context).inactiveColor = this.inactiveColor;
            return _MenuBackGround(
            child: _MenuItems(items),
           );
          },
            
        ),
      ),
    );
  }
}

class _MenuBackGround extends StatelessWidget {
  
  final Widget child;

  _MenuBackGround({required this.child});

  @override
  Widget build(BuildContext context) {
    Color color =  Provider.of<_MenuModel>(context).backGroundColor;
    return Container(

      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(0,1),
            blurRadius: 10,
            spreadRadius: -5
          )
        ]
      ),
      child: this.child,
    );
  }
}

class _MenuItems extends StatelessWidget {

  final List<PinterestButton> menuItems;

  const _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(menuItems.length, (index) => _PinterestMenuButton(index, menuItems[index]))
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {

  final int index;
  final PinterestButton item;

  _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {

    final menuModel = Provider.of<_MenuModel>(context);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado = index;
        item.onPressed();
      },
      child: Container(
        child: Icon(
          item.icon,
          size: (menuModel.itemSeleccionado == index) ? 35 : 25,
          color: (menuModel.itemSeleccionado == index) ? menuModel.activeColor : menuModel.inactiveColor,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier{

 Color backGroundColor = Colors.white;
 Color activeColor = Colors.black; 
 Color inactiveColor = Colors.blueGrey; 

  int _itemSeleccionado = 0;
  int get itemSeleccionado => _itemSeleccionado;
  set itemSeleccionado (int index){
    this._itemSeleccionado = index;
    notifyListeners();
  }

}