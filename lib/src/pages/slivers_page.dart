import 'package:flutter/material.dart';

import 'package:flutter/material.dart';


class SliverPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Titulo()
   );
  }
}

class _ListaTareas extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (_, int index) => _ListItem()
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(30),
      margin: EdgeInsets.all(10),
      height: 130,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text('Orange', style: TextStyle(fontSize: 20, color: Colors.white),),
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