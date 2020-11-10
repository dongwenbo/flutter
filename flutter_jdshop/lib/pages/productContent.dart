import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../services/screenAdapter.dart';
import 'productContentFirstPage.dart';
import 'productContentSecondPage.dart';
import 'productContentThirdPage.dart';
import '../widget/cornerButtonWidget.dart';
import 'package:dio/dio.dart';
import '../apiConfig.dart';
import '../appConfig.dart';
import '../model/ProductContentModel.dart';
import '../widget/loadingWidget.dart';
import '../services/EventBus.dart';
import '../services/cartService.dart';
import '../provider/cartProvider.dart';
import 'package:provider/provider.dart';

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

  //轮播图数据
  ProductContentModel _productContentModel;
  _fetchProductContentModelData() async {
    String requestUrlString = AppConfig.domain +
        ApiConfig.productContentApi +
        "?id=${widget.arguments["productId"]}";
    print(requestUrlString);
    var respondData = await Dio().get(requestUrlString);
    setState(() {
      this._productContentModel =
          ProductContentModel.fromJson(respondData.data);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._fetchProductContentModelData();
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
          body: (this._productContentModel != null)
              ? Stack(
                  children: <Widget>[
                    Container(
                      child: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        children: <Widget>[
                          ProductContentFirstPage(this._productContentModel),
                          ProductContentSecondPage(this._productContentModel),
                          ProductContentThirdPage()
                        ],
                      ),
                      margin:
                          EdgeInsets.only(bottom: ScreenAdapter.height(100)),
                    ),
                    Positioned(
                        left: 0,
                        bottom: 0,
                        child: Container(
                          width:
                              ScreenAdapter.width(ScreenAdapter.designWidth()),
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
                                child: InkWell(
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(Icons.shopping_cart),
                                        Text("购物车")
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.pushNamed(context, "/cart");
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: CornerButtonWidget(
                                  title: "加入购物车",
                                  bgColor: Colors.red,
                                  callbackHandle: () async {
                                    if (this
                                            ._productContentModel
                                            .result
                                            .attr
                                            .length >
                                        0) {
                                      eventBus
                                          .fire(ProductContentEvent("加入购物车"));
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: "加入购物车",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.black45,
                                          textColor: Colors.white,
                                          fontSize: 16.0
                                      );
                                      await CartService.addProductToCart(this._productContentModel.result);
                                      context.read<CartProvider>().updateCartListData();
                                    }
                                  },
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: CornerButtonWidget(
                                    title: "立即购买",
                                    bgColor: Colors.yellow,
                                    callbackHandle: () {
                                      if (this
                                              ._productContentModel
                                              .result
                                              .attr
                                              .length >
                                          0) {
                                        eventBus
                                            .fire(ProductContentEvent("加入购物车"));
                                      } else {
                                        print("加入购物车");
                                      }
                                    },
                                  ))
                            ],
                          ),
                        ))
                  ],
                )
              : LoadingWidget(),
        ));
  }
}
