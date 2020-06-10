import 'package:flutter/material.dart';
import '../services/screenAdapter.dart';
import 'productContentFirstPage.dart';
import 'productContentSecondPage.dart';
import 'productContentThirdPage.dart';
import '../widget/cornerButtonWidget.dart';

class ProductContentPage extends StatefulWidget {
  final Map arguments;
  ProductContentPage({this.arguments});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductContentState();
  }
}

class _ProductContentState extends State<ProductContentPage> {
  _showProductMenu() async {
    showMenu(
        context: context,
        position: RelativeRect.fromLTRB(
            ScreenAdapter.width(10), ScreenAdapter.height(160), 0, 0),
        items: [
          PopupMenuItem(
            child: Row(
              children: <Widget>[Icon(Icons.home), Text("首页")],
            ),
          ),
          PopupMenuItem(
            child: Row(
              children: <Widget>[Icon(Icons.search), Text("搜索")],
            ),
          )
        ]);
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    // TODO: implement build
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Container(
              width: ScreenAdapter.width(400),
              child: TabBar(
                indicatorColor: Colors.red,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: <Widget>[
                  Tab(
                    child: Text("商品"),
                  ),
                  Tab(
                    child: Text("详情"),
                  ),
                  Tab(
                    child: Text("评价"),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.more_horiz),
                  onPressed: () {
                    this._showProductMenu();
                  })
            ],
          ),
          body: Stack(
            children: <Widget>[
              TabBarView(
                children: <Widget>[
                  ProductContentFirstPage(),
                  ProductContentSecondPage(),
                  ProductContentThirdPage()
                ],
              ),
              Positioned(
                  left: 0,
                  bottom: 0,
                  child: Container(
                    width: ScreenAdapter.width(ScreenAdapter.screenWidth()),
                    height: ScreenAdapter.height(100),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            top: BorderSide(
                                color: Colors.black12,
                                width: ScreenAdapter.height(2)))),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: ScreenAdapter.width(220),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.shopping_cart),
                                Text("购物车")
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: CornerButtonWidget(
                            title: "加入购物车",
                            bgColor: Colors.red,
                            callbackHandle: () {},
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: CornerButtonWidget(
                              title: "立即购买",
                              bgColor: Colors.yellow,
                              callbackHandle: () {},
                            ))
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
