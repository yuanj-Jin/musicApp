import 'package:flutter/material.dart';



class Float extends StatefulWidget {
  @override
  _FloatState createState() => _FloatState();
}

class _FloatState extends State<Float> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width:200.0,
      height:200.0,
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
    );
  }
}