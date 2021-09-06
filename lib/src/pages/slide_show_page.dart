import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SlideShowPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(child: _Slides()),
            _Dots()
          ],
        )
     ),
   );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: 70,
      child: Row(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          _Dot(),
          _Dot(),
          _Dot(),

        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 7),
      height: 15,
      width: 15,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black
      ),
    );
  }
}

class _Slides extends StatelessWidget {
  const _Slides({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        children: [
          _Slide(svg: 'assets/svgs/slide-1.svg',),
          _Slide(svg: 'assets/svgs/slide-2.svg'),
          _Slide(svg: 'assets/svgs/slide-3.svg'),

        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final String svg;

  const _Slide({Key? key, required this.svg}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: SvgPicture.asset(svg),
    );
  }
}