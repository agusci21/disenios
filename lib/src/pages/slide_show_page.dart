import 'package:disenios_01/src/widgets/slide_show_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SlideShowPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    bool isLarge = (MediaQuery.of(context).size.height > 500) ? true : false;

    final List<Widget> children = [
          Expanded(child: _MiSlideShow()),
          Expanded(child: _MiSlideShow())
        ];
    return Scaffold(
      body: isLarge ? Column( children: children,) : Row(children: children,)
   );
  }
}

class _MiSlideShow extends StatelessWidget {
  const _MiSlideShow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideShow(
      primaryColor: Colors.blue,
      secondaryColor: Colors.red,
      slides: <Widget>[
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
      ]
    );
  }
}