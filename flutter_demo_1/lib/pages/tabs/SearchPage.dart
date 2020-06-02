import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
              title: Row(
                children: <Widget>[
                  Expanded(
                      child: TabBar(
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
          body: TabBarView(children: [
            ListView(children: <Widget>[
              ListTile(title: Text("第一个tabbar"),)
            ],),
            ListView(children: <Widget>[
              ListTile(title: Text("第二个tabbar"),)
            ],),
            ListView(children: <Widget>[
              ListTile(title: Text("第三个tabbar"),)
            ],)
          ]),
        ));
  }
}
