import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterjdshop/model/FocusModel.dart';
import 'package:flutterjdshop/model/ProductModel.dart';
import '../services/screenAdapter.dart';
import 'package:dio/dio.dart';
import '../appConfig.dart';
import '../apiConfig.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> with AutomaticKeepAliveClientMixin {
  //轮播图
  Widget _swiperWidget() {
    if (this._focusModel != null && this._focusModel.result.length > 0) {
      return Container(
        child: AspectRatio(
          aspectRatio: 2 / 1,
          child: Swiper(
            itemCount: this._focusModel.result.length,
            itemBuilder: (context, index) {
              String picUrlString = AppConfig.domain +  this._focusModel.result[index].pic.replaceAll('\\', '/');
              return Image.network(
                '$picUrlString',
                fit: BoxFit.fill,
              );
            },
            autoplay: true,
            pagination: new SwiperPagination(),
          ),
        ),
      );
    } else {
      return Text("加载中...");
    }
  }
  Widget _titleHeader(text) {
    return Container(
      margin: EdgeInsets.only(left: ScreenAdapter.width(20)),
      padding: EdgeInsets.only(left: ScreenAdapter.width(12)),
      height: ScreenAdapter.height(36),
      child: Text(
        text,
        style: TextStyle(color: Colors.black54),
      ),
      decoration: BoxDecoration(
          border: Border(
              left: BorderSide(
                  width: ScreenAdapter.width(4), color: Colors.red))),
    );
  }

  Widget _hotProductListWidget() {
    if (this._hotProductList.length > 0) {
      return Container(
          padding: EdgeInsets.all(ScreenAdapter.width(10)),
          height: ScreenAdapter.height(220),
          child: ListView.builder(
            itemBuilder: (context, index) {
              String picUrlString = AppConfig.domain +
                  this._hotProductList[index].sPic.replaceAll('\\', '/');
              return Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
                    width: ScreenAdapter.width(140),
                    child: Image.network(
                        '$picUrlString',
                        fit: BoxFit.cover),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
                    padding: EdgeInsets.only(top: ScreenAdapter.height(10)),
                    child: Text("¥${this._hotProductList[index].price}",
                      style: TextStyle(color: Colors.red),),
                  )
                ],
              );
            },
            itemCount: this._hotProductList.length,
            scrollDirection: Axis.horizontal,
          ));
    } else {
      return Text("加载中...");
    }
  }

  Widget _recProductListWidget() {
    double itemWidth = ScreenAdapter.width(
        (ScreenAdapter.width(ScreenAdapter.screenWidth()) -
            ScreenAdapter.width(20) * 3));
    return Container(
      padding: EdgeInsets.all(ScreenAdapter.width(20)),
      child: Wrap(
        children: this._bestProductList.map((value) {
          String picUrlString = AppConfig.domain +
              value.sPic.replaceAll('\\', '/');
          return Container(
            width: itemWidth,
            padding: EdgeInsets.all(ScreenAdapter.height(20)),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Image.network(
                      '$picUrlString',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: ScreenAdapter.height(12)),
                    child: Text(
                      '${value.title}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )),
                Container(
                    height: ScreenAdapter.height(66),
                    padding: EdgeInsets.only(top: ScreenAdapter.height(12)),
                    child: Stack(children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '¥${value.price}',
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '¥${value.oldPrice}',
                          style: TextStyle(color: Colors.black54,
                              fontSize: 15,
                              decoration: TextDecoration.lineThrough),
                        ),
                      )
                    ])
                )
              ],
            ),
          );
        }).toList(),
        runSpacing: ScreenAdapter.width(20),
        spacing: ScreenAdapter.width(20),
      ),
    );
  }

  //轮播图数据
  FocusModel _focusModel;
  _fetchFocusModelData() async {
    String requestUrlString = AppConfig.domain + ApiConfig.focusApi;
    var respondData = await Dio().get(requestUrlString);
    setState(() {
      this._focusModel = FocusModel.fromJson(respondData.data);
    });
  }
  //猜你喜欢数据
  List<ProductItem> _hotProductList = [];
  _fetchHotProductModelData() async {
    String requestUrlString = AppConfig.domain + ApiConfig.productListApi + "?is_hot=1";
    var respondData = await Dio().get(requestUrlString);
    setState(() {
      this._hotProductList = ProductModel.fromJson(respondData.data).result;
    });
  }
  //热门推荐数据
  List<ProductItem> _bestProductList = [];
  _fetchBestProductModelData() async {
    String requestUrlString = AppConfig.domain + ApiConfig.productListApi + "?is_best=1";
    var respondData = await Dio().get(requestUrlString);
    setState(() {
      this._bestProductList = ProductModel.fromJson(respondData.data).result;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._fetchFocusModelData();
    this._fetchHotProductModelData();
    this._fetchBestProductModelData();
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    // TODO: implement build
    return ListView(
      children: <Widget>[
        _swiperWidget(),
        SizedBox(
          height: ScreenAdapter.height(10),
        ),
        _titleHeader("猜你喜欢"),
        SizedBox(
          height: ScreenAdapter.height(10),
        ),
        _hotProductListWidget(),
        _titleHeader("热门推荐"),
        _recProductListWidget()
      ],
    );
  }
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
