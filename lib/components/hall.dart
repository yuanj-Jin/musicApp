import 'package:flutter/material.dart';
import 'package:musicapp/components/music/player.dart';
class Hall extends StatefulWidget {
  @override
  _HallState createState() => _HallState();
}

class _HallState extends State<Hall> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Player(),
    );
  }
}
