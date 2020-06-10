import 'package:flutter/material.dart';
import 'home.dart';
import 'category.dart';
import 'cart.dart';
import 'mine.dart';
import '../services/screenAdapter.dart';

class Tabs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TabsState();
  }
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  List<Widget> _pageList = [
    MyHomePage(),
    CategoryPage(),
    CartPage(),
    MinePage()
  ];
  PageController _pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._pageController = PageController(initialPage: this._currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: RawMaterialButton(
          onPressed: () {
            Navigator.pushNamed(context, "/search");
          },
          child: Row(
            children: <Widget>[
              Icon(Icons.search, size: ScreenAdapter.height(36),),
              Text("搜索")
            ],
          ),
          fillColor: Color.fromRGBO(233, 233, 233, 0.8),
          padding: EdgeInsets.only(left: ScreenAdapter.width(20)),
          shape: StadiumBorder(side: BorderSide.none),
        ),
        leading:
            IconButton(icon: Icon(Icons.center_focus_weak), onPressed: () {}),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.message), onPressed: () {})
        ],
      ),
//1、不保持页面状态
//    body: this._pageList[this._currentIndex],
//2、全部保持页面状态
//      body: IndexedStack(
//        index: this._currentIndex,
//        children: this._pageList,
//      ),
//3、部分页面保持页面状态
      body: PageView(
        controller: this._pageController,
        children: this._pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: this._currentIndex,
          onTap: (index) {
            setState(() {
              this._currentIndex = index;
              this._pageController.jumpToPage(index);
            });
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.red,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
            BottomNavigationBarItem(
              icon: Icon((Icons.category)),
              title: Text("分类"),
            ),
            BottomNavigationBarItem(
                icon: Icon((Icons.shopping_cart)), title: Text("购物车")),
            BottomNavigationBarItem(
                icon: Icon((Icons.people)), title: Text("我的"))
          ]),
    );
  }
}
