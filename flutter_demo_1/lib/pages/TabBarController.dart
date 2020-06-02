import 'package:flutter/material.dart';

class TabBarControllerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TabBarControllerPageState();
  }
}

class _TabBarControllerPageState extends State<StatefulWidget>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);
    _tabController.addListener(() {
      print("asdasdf+${_tabController.index}");
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: <Widget>[
          Expanded(
              child: TabBar(
            controller: this._tabController,
            tabs: [
              Tab(
                text: "推荐",
              ),
              Tab(
                text: "推荐",
              ),
              Tab(
                text: "推荐",
              ),
            ],
          ))
        ],
      )),
      body: TabBarView(controller: this._tabController, children: [
        ListView(
          children: <Widget>[
            ListTile(
              title: Text("第一个tabbar"),
            )
          ],
        ),
        ListView(
          children: <Widget>[
            ListTile(
              title: Text("第二个tabbar"),
            )
          ],
        ),
        ListView(
          children: <Widget>[
            ListTile(
              title: Text("第三个tabbar"),
            )
          ],
        )
      ]),
    );
  }
}
