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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 80.0,
        width: 80.0,
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(top: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: FloatingActionButton (
          child: Icon(Icons.add, size: 40,),
          backgroundColor: this._currentIndex == 1 ? Colors.red : Colors.yellow,
          onPressed: (){
            setState(() {
              this._currentIndex = 1;
            });
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
          BottomNavigationBarItem(
              icon: Icon(Icons.contacts), title: Text("通讯录")),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("搜索")),
          BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("设置"))
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: this._currentIndex,
        onTap: (int index) {
          setState(() {
            this._currentIndex = index;
          });
        },
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
//            DrawerHeader(child: Row(
//              children: <Widget>[
//                Expanded(child: Text("asdfas"))
//              ],
//            )),
            UserAccountsDrawerHeader(
              accountName: Text("asdf"),
              accountEmail: Text("data"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://oimageb8.ydstatic.com/image?id=7541070610869733661&product=adpublish&w=250&h=250&sc=0&rm=0"),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://oimageb8.ydstatic.com/image?id=7541070610869733661&product=adpublish&w=250&h=250&sc=0&rm=0"),
                    fit: BoxFit.cover),
              ),
            ),
            ListTile(
              title: Text("我的空间"),
              leading: CircleAvatar(
                child: Icon(Icons.home),
              ),
            ),
            Divider(),
            ListTile(
              title: Text("设置"),
              leading: CircleAvatar(
                child: Icon(Icons.home),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, "/loginPage");
              },
            )
          ],
        ),
      ),
    );
  }
}
