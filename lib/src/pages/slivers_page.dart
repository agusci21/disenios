import 'package:flutter/material.dart';



class SliverPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _MainScroll()
   );
  }
}

class _ListaTareas extends StatelessWidget {

   final items = [
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];
 
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (_, int index) => items[index]
    );
  }
}

class _ListItem extends StatelessWidget {
  
  final String titulo;
  final Color color;

  const _ListItem(this.titulo, this.color) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(30),
      margin: EdgeInsets.all(10),
      height: 130,
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(this.titulo, style: TextStyle(fontSize: 20, color: Colors.white),),
    );
  }
}

class _Titulo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(height: 30,),

        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Text('New', style: TextStyle(color: Color(0xff532128),fontSize: 50),),
        ),

        Stack(
          children: [
            SizedBox(width: 100,),
            Positioned(
              bottom: 8,
              child: Container(
                width: 150,
                height: 8,
                color: Color(0xffF7CDD5),
              ),
            ),

            Container(
              child: Text('List',style: TextStyle(color: Color(0xffD93A30),fontSize: 50,fontWeight: FontWeight.bold),),
            ),
            
            

          ],
        ),

      ],
    );
  }
}

class _MainScroll extends StatelessWidget {

  final items = [
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [

        SliverAppBar(
          elevation: 0,
          floating: true,
          backgroundColor: Colors.red,
          title: Center(child: Text('Hola Mundo')),
        ),

        SliverList(
          delegate: SliverChildListDelegate(items)
        ),
      ],
    );
  }
}