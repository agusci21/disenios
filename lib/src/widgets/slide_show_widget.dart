import 'package:disenios_01/src/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideShow extends StatelessWidget {

  final List<Widget> slides;
  bool puntosAriba;
  final Color prymariColor;
  final Color secondaryColor;

  SlideShow({
    required this.slides,
    this.puntosAriba = false,
    this.prymariColor = Colors.blue,
    this.secondaryColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderModel(),
      child: SafeArea(
        child: Center(
            child: Column(
              children: [

                if(puntosAriba) 
                  _Dots(this.slides.length, this.prymariColor, this.secondaryColor),
               
                Expanded(child: _Slides(this.slides)),

                if(!puntosAriba) 
                  _Dots(this.slides.length, this.prymariColor, this.secondaryColor),

              ],
            )
         ),
      ),
    );
  }
}


class _Dots extends StatelessWidget {

  final int totalSlides;
  final Color prymariColor;
  final Color secondaryColor;

  const _Dots(this.totalSlides, this.prymariColor, this.secondaryColor);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: 70,
      child: Row(

        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(this.totalSlides, (index) => _Dot(index, this.prymariColor, this.secondaryColor)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  

  final int index;
  final Color prymariColor;
  final Color secondaryColor;

  const _Dot(this.index, this.prymariColor, this.secondaryColor);

  @override
  Widget build(BuildContext context) {

    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 7),
      height: 15,
      width: 15,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: (pageViewIndex >= index -0.5 && pageViewIndex < index +0.5)
         ? this.prymariColor : this.secondaryColor
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
      Provider.of<SliderModel>(context, listen: false).currentPage = pageViewController.page as double;
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