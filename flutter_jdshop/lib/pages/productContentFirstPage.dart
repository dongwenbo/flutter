import 'package:flutter/material.dart';
import '../services/screenAdapter.dart';
import '../widget/cornerButtonWidget.dart';

class ProductContentFirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductContentFirstState();
  }
}

class _ProductContentFirstState extends State<ProductContentFirstPage> {
  _showScreenMenuWidget() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Stack(children: <Widget>[
            Container(
              height: ScreenAdapter.height(800),
              padding: EdgeInsets.fromLTRB(ScreenAdapter.width(20), ScreenAdapter.width(20), ScreenAdapter.width(20), ScreenAdapter.width(180)),
              child: ListView(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: ScreenAdapter.height(20)),
                        height: ScreenAdapter.height(55),
                        width: ScreenAdapter.width(120),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "颜色：",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: Wrap(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 0, ScreenAdapter.width(20), 0),
                                child: Chip(label: Text("白色")),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 0, ScreenAdapter.width(20), 0),
                                child: Chip(label: Text("白色")),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 0, ScreenAdapter.width(20), 0),
                                child: Chip(label: Text("白色")),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 0, ScreenAdapter.width(20), 0),
                                child: Chip(label: Text("白色")),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 0, ScreenAdapter.width(20), 0),
                                child: Chip(label: Text("白色")),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 0, ScreenAdapter.width(20), 0),
                                child: Chip(label: Text("白色")),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 0, ScreenAdapter.width(20), 0),
                                child: Chip(label: Text("白色")),
                              ),
                            ],
                          ))
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: ScreenAdapter.height(20)),
                        height: ScreenAdapter.height(55),
                        width: ScreenAdapter.width(120),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "尺寸：",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: Wrap(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 0, ScreenAdapter.width(20), 0),
                                child: Chip(label: Text("白色")),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 0, ScreenAdapter.width(20), 0),
                                child: Chip(label: Text("白色")),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 0, ScreenAdapter.width(20), 0),
                                child: Chip(label: Text("白色")),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 0, ScreenAdapter.width(20), 0),
                                child: Chip(label: Text("白色")),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 0, ScreenAdapter.width(20), 0),
                                child: Chip(label: Text("白色")),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 0, ScreenAdapter.width(20), 0),
                                child: Chip(label: Text("白色")),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 0, ScreenAdapter.width(20), 0),
                                child: Chip(label: Text("白色")),
                              ),
                            ],
                          ))
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              width: ScreenAdapter.width(ScreenAdapter.screenWidth()),
              height: ScreenAdapter.height(90),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: CornerButtonWidget(
                        bgColor: Color.fromRGBO(253, 1, 0, 0.9),
                        title: "加入购物车",
                        callbackHandle: () {
                          print('加入购物车');
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: CornerButtonWidget(
                          bgColor: Color.fromRGBO(255, 165, 0, 0.9),
                          title: "立即购买",
                          callbackHandle: () {
                            print('立即购买');
                          },
                        )),
                  )
                ],
              ),
            )

          ],);
        });
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(ScreenAdapter.width(20)),
      child: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              "https://www.itying.com/images/flutter/p1.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenAdapter.height(20)),
            child: Text(
              "联想ThinkPad 翼480（0VCD） 英特尔酷睿i5 14英寸轻薄窄边框笔记本电脑",
              style: TextStyle(
                  color: Colors.black87, fontSize: ScreenAdapter.fontSize(36)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenAdapter.height(20)),
            child: Text(
                "震撼首发，15.9毫米全金属外观，4.9毫米轻薄窄边框，指纹电源按钮，杜比音效，2G独显，预装正版office软件",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: ScreenAdapter.fontSize(28))),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenAdapter.height(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("特价："),
                    Text("¥28",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: ScreenAdapter.fontSize(46)))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("原价："),
                    Text("¥28",
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: ScreenAdapter.fontSize(28),
                            decoration: TextDecoration.lineThrough))
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(
                0, ScreenAdapter.height(40), 0, ScreenAdapter.height(40)),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Color.fromRGBO(233, 233, 233, 0.8), width: 1))),
            child: InkWell(
              child: Row(
                children: <Widget>[
                  Text(
                    "已选：",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("115，黑色，XL，1件")
                ],
              ),
              onTap: () {
                _showScreenMenuWidget();
              },
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(
                0, ScreenAdapter.height(40), 0, ScreenAdapter.height(40)),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Color.fromRGBO(233, 233, 233, 0.8), width: 1))),
            child: Row(
              children: <Widget>[
                Text(
                  "运费：",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("免费")
              ],
            ),
          )
        ],
      ),
    );
  }
}
