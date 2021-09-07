import 'package:flutter/material.dart';

class PinterestButton{
  final Function onPressed;
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
    return Center(
      child: Container(


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
        child:_MenuItems(items),
      ),
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
    return Container(
      child: Icon(item.icon),
    );
  }
}