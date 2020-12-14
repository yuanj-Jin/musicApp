import 'package:flutter/material.dart';
import 'package:musicapp/components/mine.dart';
import 'package:musicapp/router/router.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Content(),
      ),
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
//      home: Content(),
      onGenerateRoute: onGenerateRoute,
//      initialRoute: '/',

    );
  }
}


//主框架
class Content extends StatefulWidget {
  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            children: <Widget>[
              RaisedButton(
                child: Text("Mine"),
                onPressed: (){
                  print("Mine");
                },
              ),
              RaisedButton(
                child: Text("Square"),
                onPressed: (){
                  print("Square");
                },
              ),
              RaisedButton(
                child: Text("Other"),
                onPressed: (){
                  print("Other");
                },
              )
            ],
          ),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: (){
              print("Square");
            },
          ),
          actions: <Widget>[
            //右侧
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: (){
                print("Square");
              },
            ),
          ],
        ),





        floatingActionButton: FloatingActionButton(
          onPressed: (){

          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      );
  }
}

