
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton{
  var onPressed;
  final IconData icon;

  PinterestButton({required this.onPressed, required this.icon});
}

class PinterestMenu extends StatelessWidget {

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
      child: _MenuBackGround(
        child: _MenuItems(items),
      ),
    );
  }
}

class _MenuBackGround extends StatelessWidget {
  
  final Widget child;

  _MenuBackGround({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(

      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
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

    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado = index;
        item.onPressed();
      },
      child: Container(
        child: Icon(
          item.icon,
          size: (itemSeleccionado == index) ? 35 : 25,
          color: (itemSeleccionado == index) ? Colors.black : Colors.blueGrey,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier{

  int _itemSeleccionado = 0;
  int get itemSeleccionado => _itemSeleccionado;
  set itemSeleccionado (int index){
    this._itemSeleccionado = index;
    notifyListeners();
  }

}