import 'package:flutter/material.dart';



//class Head extends StatefulWidget {
//  @override
//  _HeadState createState() => _HeadState();
//}
//
//class _HeadState extends State<Head> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        leading: Icon(Icons.menu),
//        actions: <Widget>[
////          IconButton(
////              icon: Icon(Icons.settings),
////              onPressed: () {
////                print("menu");
////              }
////          ),
////          IconButton(
////              icon: Icon(Icons.search),
////              onPressed: () {
////                print("menu");
////              }
////          ),
//        ],
//      ),
//    );
//  }
//}



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

class Head extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){
            print("object");
          },
        ),
        FlatButton(
          child: Text(
            "Mine",
            style: TextStyle(color: Colors.white,),
          ),
          onPressed: (){
            Navigator.pushNamed(context, 'profile');
          },
        ),
        FlatButton(
          child: Text(
            "WOW",
            style: TextStyle(color: Colors.white,),),
        ),
        FlatButton(
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


