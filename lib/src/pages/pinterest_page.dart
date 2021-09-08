import 'package:disenios_01/src/widgets/pinterest_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';


class PinterestPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MenuModel(),
      child: Scaffold(
        body: Stack(
          children: [
            PinterestGrid(),
            _PinterestMenuLocation()
          ],
        )
       ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  const _PinterestMenuLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mostrar = Provider.of<MenuModel>(context).mostrar;
    final double sw = MediaQuery.of(context).size.width;
    return Positioned(
      bottom: 30,
      child: Container(
        width: sw,
        child: Align(
          child: PinterestMenu(
            mostrar: mostrar,
            activeColor: Colors.green,
            inactiveColor: Colors.yellow,
          ),
        ),
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {

  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {

  final List<int> items = List.generate(200, (index) => index);
  ScrollController controller = ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() {
    controller.addListener(() {
      if(controller.offset > scrollAnterior && controller.offset > 150){
        Provider.of<MenuModel>(context, listen: false).mostrar = false;
      }else{
        Provider.of<MenuModel>(context, listen: false).mostrar = true;
      }
      scrollAnterior = controller.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      controller: controller,
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
        )
      );
  }
}

class MenuModel with ChangeNotifier{
  bool _mostrar = true;
  bool get mostrar => this._mostrar;
  set mostrar (bool value){
    this._mostrar = value;
    notifyListeners();
  }
}