import 'package:flutter/material.dart';
import 'package:musicapp/components/head.dart';


class Mine extends StatefulWidget {
  //路由传参
  final arguments;
  Mine({this.arguments});

  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {
  int _counter = 0;
  static List items = ["IU (아이유) - 喜帖街 (Live).mp3","儿歌 - 兔子舞.mp3","古巨基 - 谁愿放手 (Live).mp3",
    "影视原声 - 风舞（《斗罗大陆》动画片尾曲）.mp3","芸熙儿 - 你的眼神 (Live).mp3"];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  /*这里我们自己新建一个方法，很简单，就是执行减一操作*/
  void _reduceCounter() {
    print(this._counter);
    setState(() {
      _counter--;
    });
  }

  //新建一个小玩意儿widget
  static Widget SongList(){
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
    return Scaffold(
      appBar: AppBar(
        title: Head()
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.jpg"),
              fit: BoxFit.cover,
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,//垂直居中对齐方式
          children: <Widget>[
            /*
            歌单行
             */
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
                RaisedButton(
                    onPressed: _reduceCounter,
                    child: Text("一")
                ),
              ],
            ),
            Row(
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