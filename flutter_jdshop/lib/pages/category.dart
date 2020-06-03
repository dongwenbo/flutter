import 'dart:math';

import 'package:flutter/material.dart';
import '../services/screenAdapter.dart';
import 'package:dio/dio.dart';
import '../model/CategoryModel.dart';
import '../apiConfig.dart';
import '../appConfig.dart';

class CategoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CategoryPageState();
  }
}

class _CategoryPageState extends State<CategoryPage>
    with AutomaticKeepAliveClientMixin {
  int _selectIndex = 0;

  Widget _leftCategoryListWidget() {
    if (this._leftCategoryList.length > 0) {
      return Expanded(
          flex: 1,
          child: Container(
            height: double.infinity,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      this._selectIndex = index;
                      this._fetchRightCategoryListData(
                          this._leftCategoryList[index].sId);
                    });
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
                        height: ScreenAdapter.height(84),
                        child: Text(
                          "${this._leftCategoryList[index].title}",
                          textAlign: TextAlign.center,
                        ),
                        color: this._selectIndex == index
                            ? Color.fromRGBO(240, 246, 246, 0.9)
                            : Colors.white,
                      ),
                      Divider(
                        height: 1.0,
                      )
                    ],
                  ),
                );
              },
              itemCount: this._leftCategoryList.length,
            ),
          ));
    } else {
      return Expanded(
        flex: 1,
        child: Container(
          height: double.infinity,
        ),
      );
    }
  }

  Widget _rightCategoryListWidget(double padding, double axisSpacing,
      double itemWidth, double itemHeight, double textHeight) {
    if (this._rightCategoryList.length > 0) {
      return Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.all(padding),
            height: double.infinity,
            color: Color.fromRGBO(240, 246, 246, 0.9),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: axisSpacing,
                  mainAxisSpacing: axisSpacing,
                  childAspectRatio: itemWidth / itemHeight),
              itemBuilder: (context, index) {
                String picUrlString = AppConfig.domain +
                    this._rightCategoryList[index].pic.replaceAll('\\', '/');
                return InkWell(
                  child: Container(
                      child: Column(
                        children: <Widget>[
                          AspectRatio(
                              aspectRatio: 1 / 1,
                              child: Image.network("$picUrlString",
                                  fit: BoxFit.cover)),
                          Container(
                              height: textHeight,
                              child:
                              Text("${this._rightCategoryList[index].title}"))
                        ],
                      )),
                  onTap: () {
                    Navigator.of(context).pushNamed("/productList", arguments:{"cid": "${this._rightCategoryList[index].sId}"});
                  },
                );
              },
              itemCount: this._rightCategoryList.length,
            ),
          ));
    } else {
      return Expanded(
          flex: 3,
          child: Container(
            height: double.infinity,
            color: Color.fromRGBO(240, 246, 246, 0.9),
          ));
    }
  }

  //左侧分类数据
  List<CategoryItem> _leftCategoryList = [];

  _fetchLeftCategoryListData() async {
    String requestUrlString = AppConfig.domain + ApiConfig.categoryListApi;
    var respondData = await Dio().get(requestUrlString);
    setState(() {
      this._leftCategoryList = CategoryModel.fromJson(respondData.data).result;
      this._fetchRightCategoryListData(this._leftCategoryList[0].sId);
    });
  }

  //右侧分类数据
  List<CategoryItem> _rightCategoryList = [];

  _fetchRightCategoryListData(String pid) async {
    String requestUrlString =
        AppConfig.domain + ApiConfig.categoryListApi + "?pid=$pid";
    var respondData = await Dio().get(requestUrlString);
    setState(() {
      this._rightCategoryList = CategoryModel.fromJson(respondData.data).result;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._fetchLeftCategoryListData();
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    //size计算
    double _axisSpacing = ScreenAdapter.width(20);
    double _padding = ScreenAdapter.width(16);
    double _itemWidth = ScreenAdapter.width(ScreenAdapter.screenWidth() / 4) -
        (_axisSpacing * 2) -
        _padding * 2;
    double _textHeight = ScreenAdapter.height(40);
    double _itemHeight = _itemWidth + _textHeight;

    // TODO: implement build
    return Row(
      children: <Widget>[
        this._leftCategoryListWidget(),
        this._rightCategoryListWidget(
            _padding, _axisSpacing, _itemWidth, _itemHeight, _textHeight)
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
