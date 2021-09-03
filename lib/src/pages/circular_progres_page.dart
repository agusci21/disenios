import 'package:flutter/material.dart';

class CircularProgresPage extends StatefulWidget {
  CircularProgresPage({Key? key}) : super(key: key);

  @override
  _CircularProgresPageState createState() => _CircularProgresPageState();
}

class _CircularProgresPageState extends State<CircularProgresPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.red,
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}