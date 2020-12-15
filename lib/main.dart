import 'package:flutter/material.dart';
import 'package:musicapp/components/hall.dart';
import 'package:musicapp/components/mine.dart';
import 'package:musicapp/components/square.dart';
import 'package:musicapp/components/float.dart';
import 'package:musicapp/router/router.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,//去掉debug图标
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
            children: [
              Expanded(//显示在标题位置
                child: TabBar(
                  tabs: [
                    Tab(text: "Mine",),
                    Tab(text: "Square",),
                    Tab(text: "Hall",)
                  ],
                ),
              )
            ],
          ),


          /**
           * 右侧按钮
           */
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: (){
              print("Menu");
            },
          ),
          actions: <Widget>[
            //右侧
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: (){
                print("settings");
              },
            ),
          ],
        ),

        body: TabBarView(
          children: [
            ListView(
              children: [
                Mine()
              ],
            ),
            ListView(
              children: [
                Square()
              ],
            ),
            ListView(
              children: [
                Hall()
              ],
            )
          ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: (){
            print(("floatingActionButton"));
          },
          tooltip: 'Increment',
          // child: Icon(Icons.audiotrack),
          child: Float(),
        ),
      );
  }
}

