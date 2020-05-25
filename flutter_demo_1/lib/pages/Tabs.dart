import 'package:flutter/material.dart';
import 'Tabs/HomePage1.dart';
import 'Tabs/ContactsBookPage.dart';
import 'Tabs/SearchPage.dart';
import 'Tabs/SettingPage.dart';

class Tabs extends StatefulWidget {
  final Map arguments;
  Tabs({this.arguments});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TabsState();
  }
}

class _TabsState extends State<StatefulWidget> {
  int _currentIndex = 0;
  List pages = [HomePage1(), ContactsBookPage(), SearchPage(), SettingPage()];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: this.pages[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("首页")),
          BottomNavigationBarItem(icon: Icon(Icons.contacts),title: Text("通讯录")),
          BottomNavigationBarItem(icon: Icon(Icons.search),title: Text("搜索")),
          BottomNavigationBarItem(icon: Icon(Icons.settings),title: Text("设置"))
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: this._currentIndex,
        onTap: (int index) {
          setState(() {
            this._currentIndex = index;
          });
        },
      ),
    );
  }
}
