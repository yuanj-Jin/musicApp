import 'package:flutter/material.dart';

//有状态组件
class Square extends StatefulWidget {
  @override
  _SquareState createState() => _SquareState();
}

class _SquareState extends State<Square> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width:200.0,
      height:200.0,
      decoration: BoxDecoration(
        color: Colors.purple,
      ),
      child: Column(
        children: [
          IconButton(icon: Icon(Icons.video_call),
              onPressed: (){
                Navigator.pushNamed(context,"videoPlayer");
              }),

          IconButton(icon: Icon(Icons.youtube_searched_for),
              onPressed: (){
                Navigator.pushNamed(context,"youtubePlayer");
              })
        ],
      ),
    );
  }
}



