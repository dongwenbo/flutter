import 'package:flutter/material.dart';
import '../services/screenAdapter.dart';
import 'package:dio/dio.dart';
import '../appConfig.dart';
import '../apiConfig.dart';
import '../model/ProductModel.dart';
import '../widget/loadingWidget.dart';

class ProductListPage extends StatefulWidget {
  Map arguments = {};
  ProductListPage({Key key, this.arguments}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductListPageState();
  }
}

class _ProductListPageState extends State<ProductListPage> {
  //全局GlobalKey
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  //ScrollController
  ScrollController _scrollController = new ScrollController();
  //选中id
  int _selectHeaderId = 1;
  //textFiledController
  TextEditingController _textEditingController = TextEditingController();

  Widget _productListWidget() {
    if (this._productList.length > 0) {
      return Container(
        padding: EdgeInsets.all(ScreenAdapter.height(20)),
        margin: EdgeInsets.only(top: ScreenAdapter.height(90)),
        child: ListView.builder(
          controller: this._scrollController,
          itemBuilder: (context, index) {
            String picUrlString = AppConfig.domain +
                this._productList[index].sPic.replaceAll('\\', '/');
            return Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: ScreenAdapter.width(180),
                      child: AspectRatio(
                        aspectRatio: 1 / 1,
                        child: Image.network(
                          "$picUrlString",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                          padding:
                              EdgeInsets.only(left: ScreenAdapter.width(20)),
                          height: ScreenAdapter.height(180),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("${this._productList[index].title}",
                                  maxLines: 2, overflow: TextOverflow.ellipsis),
                              Row(
                                children: <Widget>[
                                  Container(
                                    height: ScreenAdapter.height(45),
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(
                                        right: ScreenAdapter.width(16)),
                                    padding: EdgeInsets.fromLTRB(
                                        ScreenAdapter.width(25),
                                        0,
                                        ScreenAdapter.width(25),
                                        0),
                                    child: Text("4g"),
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromRGBO(230, 230, 230, 0.9),
                                        borderRadius: BorderRadius.circular(
                                            ScreenAdapter.height(45) / 2)),
                                  ),
                                  Container(
                                    height: ScreenAdapter.height(45),
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(
                                        right: ScreenAdapter.width(16)),
                                    padding: EdgeInsets.fromLTRB(
                                        ScreenAdapter.width(25),
                                        0,
                                        ScreenAdapter.width(25),
                                        0),
                                    child: Text("126"),
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromRGBO(230, 230, 230, 0.9),
                                        borderRadius: BorderRadius.circular(
                                            ScreenAdapter.height(45) / 2)),
                                  )
                                ],
                              ),
                              Text(
                                "¥${this._productList[index].price}",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 16),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
                Divider(),
                _showMoreLoadingWidget(index)
              ],
            );
          },
          itemCount: this._productList.length,
        ),
      );
    } else {
      if (this._fetchFlag == true) {
        return Center(
          child: Text("暂无数据"),
        );
      } else {
        return Center();
      }
    }
  }

  Widget _screenHeaderItemIconWidget(int id) {
    if (id == 2 || id == 3) {
      if (this._subHeaderList[id - 1]["sort"] == -1) {
        return Icon(Icons.arrow_drop_down);
      }
      return Icon(Icons.arrow_drop_up);
    }
    return Text("");
  }

  Widget _screenHeaderWidget() {
    return Positioned(
      height: ScreenAdapter.height(90),
      width: ScreenAdapter.width(ScreenAdapter.designWidth()),
      child: Container(
        child: Row(
          children: this._subHeaderList.map((value) {
            return Expanded(
              child: MaterialButton(
                onPressed: () {
                  this._screenHeaderItemClick(value["id"]);
                },
                child: Row(
                  children: <Widget>[
                    Text(
                      "${value["title"]}",
                      style: TextStyle(
                          color: value["id"] == this._selectHeaderId
                              ? Colors.red
                              : Colors.black54),
                    ),
                    this._screenHeaderItemIconWidget(value["id"])
                  ],
                ),
              ),
              flex: 1,
            );
          }).toList(),
        ),
      ),
      top: 0,
    );
  }

  Widget _showMoreLoadingWidget(int index) {
    if (index == this._productList.length - 1) {
      if (this._hasMore) {
        return LoadingWidget();
      } else {
        return Text("-----我是底线----");
      }
    } else {
      return Text("");
    }
  }

  /*二级导航数据*/
  List _subHeaderList = [
    {
      "id": 1,
      "title": "综合",
      "fileds": "all",
      "sort":
          -1, //排序     升序：price_1     {price:1}        降序：price_-1   {price:-1}
    },
    {"id": 2, "title": "销量", "fileds": 'salecount', "sort": -1},
    {"id": 3, "title": "价格", "fileds": 'price', "sort": -1},
    {"id": 4, "title": "筛选"}
  ];

//获取列表数据
// 参数
  int _page = 1;
  final _pageSize = 8;
  String _sort = "";
  List<ProductItem> _productList = [];
  bool _fetchFlag = false;
  bool _hasMore = true;
  String _cid;
  String _keywords;

  _refreshProductListData() {
    this._page = 1;
    this._hasMore = true;
    this._fetchProductListData();
  }

  _fetchProductListData() async {
    if (this._fetchFlag || !this._hasMore) {
      return;
    }
    //标示变更
    setState(() {
      this._fetchFlag = true;
    });
    String requestUrlString;
    if (this._keywords == null) {
      requestUrlString = AppConfig.domain +
          ApiConfig.productListApi +
          "?cid=${this._cid}" +
          "&sort=$_sort" +
          "&pageSize=${this._pageSize}" +
          "&page=${this._page}";
    } else {
      requestUrlString = AppConfig.domain +
          ApiConfig.productListApi +
          "?search=${this._keywords}" +
          "&sort=$_sort" +
          "&pageSize=${this._pageSize}" +
          "&page=${this._page}";
    }

    var respondData = await Dio().get(requestUrlString);
    List<ProductItem> _tempList =
        ProductModel.fromJson(respondData.data).result;
    setState(() {
      if (this._page == 1) {
        this._productList = _tempList;
      } else {
        this._productList.addAll(_tempList);
      }
      //页码更变
      this._page += 1;
      //标示变更
      this._fetchFlag = false;
      //更多判断
      this._hasMore = !(_tempList.length < this._pageSize);
    });
    print(requestUrlString);
  }

  _screenHeaderItemClick(int id) {
    if (id == 4) {
      this._scaffoldKey.currentState.openEndDrawer();
      setState(() {
        this._selectHeaderId = id;
      });
    } else {
      setState(() {
        this._selectHeaderId = id;
        this._subHeaderList[id - 1]["sort"] *= -1;
        this._sort =
            "${this._subHeaderList[id - 1]["fileds"]}_${this._subHeaderList[id - 1]["sort"]}";
        this._scrollController.jumpTo(0);
        //刷新网络
        this._refreshProductListData();
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._keywords = widget.arguments["keywords"];
    this._cid = widget.arguments["cid"];
    this._textEditingController.text = this._keywords;
    this._fetchProductListData();
    this._scrollController.addListener(() {
      //偏移量
      double contentOffsetY = this._scrollController.position.pixels;
      //contentSize
      double contentSize = this._scrollController.position.maxScrollExtent;
      if (contentOffsetY > contentSize - 20) {
        this._fetchProductListData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Container(
          child: TextField(
            controller: this._textEditingController,
            maxLines: 1,
            autofocus: false,
            decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none)),
            onChanged: (value) {
              this._keywords = value;
            },
          ),
          height: ScreenAdapter.height(68),
          decoration: BoxDecoration(
              color: Color.fromRGBO(233, 233, 233, 0.8),
              borderRadius: BorderRadius.circular(30)),
        ),
        actions: <Widget>[
          InkWell(
            child: Container(
              height: ScreenAdapter.height(68),
              width: ScreenAdapter.width(80),
              child: Row(
                children: <Widget>[Text("搜索")],
              ),
            ),
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
              this._screenHeaderItemClick(1);
            },
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          _productListWidget(),
          _screenHeaderWidget(),
        ],
      ),
      endDrawer: Drawer(
        child: Text("筛选"),
      ),
    );
  }
}
