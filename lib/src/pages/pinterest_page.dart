import 'package:disenios_01/src/widgets/pinterest_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class PinterestPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          PinterestGrid(),
          _PinterestMenuLocation()
        ],
      )
   );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  const _PinterestMenuLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    return Positioned(
      bottom: 30,
      child: Container(
        width: sw,
        child: Align(
          child: PinterestMenu(),
        ),
      ),
    );
  }
}

class PinterestGrid extends StatelessWidget {

  final List<int> items = List.generate(200, (index) => index);

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
     crossAxisCount: 4,
     itemCount: items.length,
     itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
     staggeredTileBuilder: (int index) =>
         new StaggeredTile.count(2, index.isEven ? 2 : 3),
     mainAxisSpacing: 4.0,
     crossAxisSpacing: 4.0,
   );
  }
}

class _PinterestItem extends StatelessWidget {

  final int index;

  const _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(30)
      ),
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ));
  }
}