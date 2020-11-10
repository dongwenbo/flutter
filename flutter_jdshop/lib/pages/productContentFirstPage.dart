import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../services/screenAdapter.dart';
import '../widget/cornerButtonWidget.dart';
import '../model/ProductContentModel.dart';
import '../appConfig.dart';
import '../services/EventBus.dart';
import 'cart/cartListItemCount.dart';
import '../services/cartService.dart';
import 'package:provider/provider.dart';
import '../provider/cartProvider.dart';

class ProductContentFirstPage extends StatefulWidget {
  final ProductContentModel _productContentModel;
  ProductContentFirstPage(this._productContentModel);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductContentFirstState();
  }
}

class _ProductContentFirstState extends State<ProductContentFirstPage> with AutomaticKeepAliveClientMixin {
  Map _attrSelectMap = {};
  String _attrSelectString = "";
  var _showBottomScreenMenuEvent;

  List<Widget> _productAttrListWidget(Attr attrItem, state) {
    List<Widget> tempList = [];
    attrItem.list.forEach((value) {
      tempList.add(Container(
        padding: EdgeInsets.fromLTRB(0, 0, ScreenAdapter.width(20), 0),
        child: InkWell(
          onTap: () {
            state(() {
              this._attrSelectMap[attrItem.cate] = value;
              this._getAttrSelectString();
            });
          },
          child: Chip(
            label: Text(
              "$value",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: this._attrSelectMap[attrItem.cate] == value
                ? Colors.red
                : Colors.black54,
          ),
        ),
      ));
    });
    return tempList;
  }

  List<Widget> _productAttrWidget(state) {
    List<Widget> tempList = [];
    widget._productContentModel.result.attr.forEach((attrItem) {
      tempList.add(Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: ScreenAdapter.height(6)),
            height: ScreenAdapter.height(55),
            width: ScreenAdapter.width(130),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "${attrItem.cate}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Expanded(
              child: Wrap(
            children: this._productAttrListWidget(attrItem, state),
          ))
        ],
      ));
    });
    return tempList;
  }

  _showScreenMenuWidget() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, state) {
            return Stack(
              children: <Widget>[
                Container(
                  height: ScreenAdapter.height(800),
                  padding: EdgeInsets.fromLTRB(
                      ScreenAdapter.width(20),
                      ScreenAdapter.width(20),
                      ScreenAdapter.width(20),
                      ScreenAdapter.width(180)),
                  child: ListView(
                    children: <Widget>[
                      Column(
                        children: this._productAttrWidget(state),
                      ),
                      Divider(),
                      Container(
                        margin: EdgeInsets.only(top: ScreenAdapter.height(20)),
                        height: ScreenAdapter.height(55),
                        child: Row(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "数量",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            SizedBox(width: ScreenAdapter.width(20)),
                            CartListItemCount(count: widget._productContentModel.result.selectCount, addHandle: (){
                              state(() {
                                widget._productContentModel.result.selectCount += 1;
                                print(widget._productContentModel.result.selectCount);
                              });
                            }, deleteHandle: (){
                              state(() {
                                if (widget._productContentModel.result.selectCount > 1) {
                                  widget._productContentModel.result.selectCount -= 1;
                                  print(widget._productContentModel.result.selectCount);
                                }
                              });
                            })
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  width: ScreenAdapter.width(ScreenAdapter.designWidth()),
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
                            callbackHandle: () async {
                              Fluttertoast.showToast(
                                  msg: "加入购物车",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black45,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                              await CartService.addProductToCart(widget._productContentModel.result);
                              Navigator.of(context).pop();
                              context.read<CartProvider>().updateCartListData();
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
              ],
            );
          });
        });
  }

  _configAttrSelectData() {
    widget._productContentModel.result.attr.forEach((attrItem) {
      this._attrSelectMap[attrItem.cate] = attrItem.list[0];
    });
  }

  _getAttrSelectString() {
    List tempList = [];
    setState(() {
      this._attrSelectMap.forEach((key, value) {
        tempList.add(value);
      });
    });
    setState(() {
      this._attrSelectString = tempList.join("，");
      widget._productContentModel.result.selectAttrString = this._attrSelectString;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("asdfasdfasdf");
    this._configAttrSelectData();
    this._getAttrSelectString();
    this._showBottomScreenMenuEvent = eventBus.on<ProductContentEvent>().listen((event) {
      this._showScreenMenuWidget();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    this._showBottomScreenMenuEvent.cancel();
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    // TODO: implement build
    String picUrlString = AppConfig.domain +
        widget._productContentModel.result.pic.replaceAll('\\', '/');
    return Container(
      padding: EdgeInsets.all(ScreenAdapter.width(20)),
      child: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16 / 16,
            child: Image.network(
              "$picUrlString",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenAdapter.height(20)),
            child: Text(
              "${widget._productContentModel.result.title}",
              style: TextStyle(
                  color: Colors.black87, fontSize: ScreenAdapter.fontSize(36)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenAdapter.height(20)),
            child: Text("${widget._productContentModel.result.subTitle == null ? "" : widget._productContentModel.result.subTitle}",
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
                    Text("¥${widget._productContentModel.result.price}",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: ScreenAdapter.fontSize(46)))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("原价："),
                    Text("¥${widget._productContentModel.result.oldPrice}",
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: ScreenAdapter.fontSize(28),
                            decoration: TextDecoration.lineThrough))
                  ],
                )
              ],
            ),
          ),
          this._attrSelectString.length > 0
              ? Container(
                  padding: EdgeInsets.fromLTRB(
                      0, ScreenAdapter.height(40), 0, ScreenAdapter.height(40)),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color.fromRGBO(233, 233, 233, 0.8),
                              width: 1))),
                  child: InkWell(
                    child: Row(
                      children: <Widget>[
                        Text(
                          "已选：",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("${this._attrSelectString}")
                      ],
                    ),
                    onTap: () {
                      _showScreenMenuWidget();
                    },
                  ),
                )
              : Text(""),
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
