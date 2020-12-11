import 'package:flutter/material.dart';

//有状态组件
// class Head extends StatefulWidget {
//   @override
//   _HeadState createState() => _HeadState();
// }
//
// class _HeadState extends State<Head> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }


//无状态组件

class Hall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: ImageIcon(AssetImage('assets/icon/setting.png')),
        ),
        FlatButton(
          onPressed: ()=>{
            print("Mine")
          },
          child: Text(
            "Mine",
            style: TextStyle(color: Colors.white,),),
        ),
        FlatButton(
          onPressed: ()=>{
            print("WOW")
          },
          child: Text(
            "WOW",
            style: TextStyle(color: Colors.white,),),
        ),
        FlatButton(
          onPressed: ()=>{
            print("Village")
          },
          child: Text(
            "Village",
            style: TextStyle(color: Colors.white,),
          ),
          //内边距
          padding: EdgeInsets.all(0),
        ),
      ],
    );
  }
}


