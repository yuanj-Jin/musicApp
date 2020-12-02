import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
//  HomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

//  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  static List items = ["IU (아이유) - 喜帖街 (Live).mp3","儿歌 - 兔子舞.mp3","古巨基 - 谁愿放手 (Live).mp3",
    "影视原声 - 风舞（《斗罗大陆》动画片尾曲） (TV Version).mp3","芸熙儿 - 你的眼神 (Live).mp3"];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  /*这里我们自己新建一个方法，很简单，就是执行减一操作*/
  void _reduceCounter() {
    setState(() {
      _counter--;
    });
  }
  //新建一个小玩意儿widget
  static Widget SongList(){
//    items.add("IU (아이유) - 喜帖街 (Live).mp3");
//    items.add("儿歌 - 兔子舞.mp3");
    items.add("古巨基 - 谁愿放手 (Live).mp3");
    items.add("影视原声 - 风舞（《斗罗大陆》动画片尾曲） (TV Version).mp3");
    items.add("芸熙儿 - 你的眼神 (Live).mp3");
    List<Widget> tiles = [];//先建一个数组用于存放循环生成的widget
    Widget content; //单独一个widget组件，用于返回需要生成的内容widget
    for(var item in items) {
      tiles.add(
          Row(
              children: <Widget>[
                FlatButton(
                  child: Text(
                      item,
                      style: TextStyle(color: Colors.white,)
                  ),
                ),
              ]
          )
      );
    }
    content = Column(
        children: tiles //重点在这里，因为用编辑器写Column生成的children后面会跟一个<Widget>[]，
      //此时如果我们直接把生成的tiles放在<Widget>[]中是会报一个类型不匹配的错误，把<Widget>[]删了就可以了
    );
    return content;
  }
  Widget SongListWidget=SongList();

  @override
  Widget build(BuildContext context) {
//    items.add("IU (아이유) - 喜帖街 (Live).mp3");
//    items.add("儿歌 - 兔子舞.mp3");
//    items.add("古巨基 - 谁愿放手 (Live).mp3");
//    items.add("影视原声 - 风舞（《斗罗大陆》动画片尾曲） (TV Version).mp3");
//    items.add("芸熙儿 - 你的眼神 (Live).mp3");
//    print(items);
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
//        title: Text(widget.title),
      ),
      body: Container(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.jpg"),
              fit: BoxFit.cover,
            )
        ),
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
//          mainAxisAlignment: MainAxisAlignment.center,//垂直居中对齐方式
          children: <Widget>[
            //导航栏
            Row(
              children: <Widget>[
                IconButton(
                  icon: ImageIcon(AssetImage('assets/icon/setting.png')),
                ),
                FlatButton(
                  child: Text(
                    "Mine",
                    style: TextStyle(color: Colors.white,),),
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
            ),

            //信息页
            Row(
              children: <Widget>[
                Text(
                  '俊英',
                  style: Theme.of(context).textTheme.headline4,
                )
              ],
            ),

            //歌单页
            Text("我的歌单",
                style: TextStyle(color: Colors.white,
                    fontSize: 20
                )
            ),
            Row(
              children: <Widget>[
                Image(
                  height: 120,
                  width: 80,
                  image: AssetImage('assets/images/1.jpg'),
                ),
                Image(
                  height: 120,
                  width: 80,
                  image: AssetImage('assets/images/2.jpg'),
                ),
                Image(
                  height: 120,
                  width: 80,
                  image: AssetImage('assets/images/3.jpg'),
                ),
                Image(
                  height: 120,
                  width: 80,
                  image: AssetImage('assets/images/4.jpg'),
                ),Image(
                  height: 120,
                  width: 80,
                  image: AssetImage('assets/images/5.jpg'),
                ),
              ],
            ),

            Row(
              children: <Widget>[
                //歌曲列表
                Text("我的歌曲",
                    style: TextStyle(color: Colors.white,
                        fontSize: 20
                    )
                ),
                Text(
                  '$_counter',
                  style:TextStyle(color: Colors.purpleAccent,fontSize: 40),
                ),

                /*我们新增一个按钮，用来实现点击使计数器减一*/
                FlatButton(
                  /*_reduceCounter是上面我们自己新增的方法，Dart中可以把方法作为参数传递*/
                  onPressed: _reduceCounter,
                  child: Text("减一按钮",
                    style:TextStyle(color: Colors.white,fontSize: 20),),
                )
              ],
            ),
            Column(
              children: <Widget>[SongListWidget],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
