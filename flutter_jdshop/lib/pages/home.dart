import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterjdshop/model/FocusModel.dart';
import '../services/screenAdapter.dart';
import 'package:dio/dio.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<StatefulWidget> {
  //轮播图
  Widget _swiperWidget() {
    if (this._focusModel != null && this._focusModel.result.length > 0) {
      return Container(
        child: AspectRatio(
          aspectRatio: 2 / 1,
          child: Swiper(
            itemCount: this._focusModel.result.length,
            itemBuilder: (context, index) {
              String picUrlString = this._focusModel.result[index].pic;
              return Image.network(
                "http://jd.itying.com/${picUrlString.replaceAll('\\', '/')}",
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
    return Container(
        padding: EdgeInsets.all(ScreenAdapter.width(10)),
        height: ScreenAdapter.height(220),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
                  width: ScreenAdapter.width(140),
                  child: Image.network(
                      "https://www.itying.com/images/flutter/hot${index + 1}.jpg",
                      fit: BoxFit.cover),
                ),
                Container(
                  padding: EdgeInsets.only(top: ScreenAdapter.height(10)),
                  child: Text("第${index + 1}个"),
                )
              ],
            );
          },
          itemCount: 10,
          scrollDirection: Axis.horizontal,
        ));
  }

  Widget _recProductItemWidget() {
    double itemWidth = ScreenAdapter.width(
        (ScreenAdapter.width(ScreenAdapter.screenWidth()) -
            ScreenAdapter.width(20) * 3));
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
                "https://www.itying.com/images/flutter/list1.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: ScreenAdapter.height(12)),
              child: Text(
                "2019夏季新款气质高贵洋气阔太太有女人味中长款宽松大码",
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
                    "¥180.0",
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "¥1200.0",
                    style: TextStyle(color: Colors.black54, fontSize: 15, decoration: TextDecoration.lineThrough),
                  ),
                )
              ])
          )
        ],
      ),
    );
  }
  //
  FocusModel _focusModel;
  _fetchFocusModelData() async {
    var respondData = await Dio().get("http://jd.itying.com/api/focus");
    setState(() {
      this._focusModel = FocusModel.fromJson(respondData.data);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._fetchFocusModelData();
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
        Container(
          padding: EdgeInsets.all(ScreenAdapter.width(20)),
          child: Wrap(
            children: <Widget>[
              _recProductItemWidget(),
              _recProductItemWidget(),
              _recProductItemWidget(),
              _recProductItemWidget(),
              _recProductItemWidget(),
            ],
            runSpacing: ScreenAdapter.width(20),
            spacing: ScreenAdapter.width(20),
          ),
        )
      ],
    );
  }
}
