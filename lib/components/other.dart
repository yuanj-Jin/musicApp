import 'package:flutter/material.dart';

//有状态组件
class Other extends StatefulWidget {
  @override
  _OtherState createState() => _OtherState();
}

class _OtherState extends State<Other> with SingleTickerProviderStateMixin {

  TabController _tabController;

  void initState(){
    super.initState();
    _tabController=new TabController(length: 6, vsync: this);
    //添加Tabs切换监听
    _tabController.addListener(() {
      print(_tabController.index);
    });
  }

  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("你猜"),
        bottom: TabBar(
          isScrollable: true,
          controller: this._tabController,
          tabs: [
            Tab(text: "Mine",),
            Tab(text: "Hall",),
            Tab(text: "Other",),
            Tab(text: "Zlatan",),
            Tab(text: "Yuan",),
            Tab(text: "Jing",)
          ],

        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: Text("Mine"),),
          Center(child: Text("Hall"),),
          Center(child: Text("Other"),),
          Center(child: Text("Zlatan"),),
          Center(child: Text("Yuan"),),
          Center(child: Text("Jing"),)
        ],
      ),
    );
  }
}



