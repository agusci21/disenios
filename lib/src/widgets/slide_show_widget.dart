import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideShow extends StatelessWidget {

  List<Widget> slides;
  bool puntosAriba;
  Color primaryColor;
  Color secondaryColor;

  SlideShow({
    required this.slides,
    this.puntosAriba = false,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideShowModel(),
      child: SafeArea(
        child: Center(
            child: Builder(
              builder: (BuildContext context) {
                Provider.of<_SlideShowModel>(context)._primaryColor = this.primaryColor;
                Provider.of<_SlideShowModel>(context)._secondaryColor = this.secondaryColor;
                return _CreateStructureColumn(puntosAriba: puntosAriba, slides: slides);
              }
            )
         ),
      ),
    );
  }
}

class _CreateStructureColumn extends StatelessWidget {
  const _CreateStructureColumn({
    Key? key,
    required this.puntosAriba,
    required this.slides,
  }) : super(key: key);

  final bool puntosAriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        if(puntosAriba) 
          _Dots(this.slides.length,),
       
        Expanded(child: _Slides(this.slides)),

        if(!puntosAriba) 
          _Dots(this.slides.length, ),

      ],
    );
  }
}


class _Dots extends StatelessWidget {

  final int totalSlides;

  const _Dots(this.totalSlides);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: 70,
      child: Row(

        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(this.totalSlides, (index) => _Dot(index)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  

  final int index;
  
  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {

    final slideShowModel = Provider.of<_SlideShowModel>(context);

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 7),
      height: 15,
      width: 15,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: (slideShowModel.currentPage >= index -0.5 && slideShowModel._currentPage < index +0.5)
         ? slideShowModel._primaryColor : slideShowModel.secondaryColor
      ),
    );
  }
}

class _Slides extends StatefulWidget {

  final List<Widget>slides;

  _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {

  final pageViewController = PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      Provider.of<_SlideShowModel>(context, listen: false).currentPage = pageViewController.page as double;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final Widget slide;

  const _Slide(this.slide);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide
    );
  }
}

class _SlideShowModel with ChangeNotifier{

  double _currentPage = 0;
  Color _primaryColor = Colors.blue;
  Color _secondaryColor = Colors.grey;

  double get currentPage => this._currentPage;

  set currentPage(double currentPage){
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color get primaryColor => this._primaryColor;
  set primaryColor (Color color){
    this._primaryColor = color;
    notifyListeners();
  }

  Color get secondaryColor => this._secondaryColor;
  set secondaryColor (Color color){
    this._secondaryColor = color;
    notifyListeners();
  }

}