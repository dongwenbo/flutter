import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/counter.dart';
import '../services/screenAdapter.dart';
import 'cart/cartListItem.dart';
import 'package:provider/provider.dart';
import '../provider/cartProvider.dart';

class CartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CartPageState();
  }
}

class _CartPageState extends State<StatefulWidget> {
  bool _isEditState = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("cart");
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("购物车"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                setState(() {
                  this._isEditState = !this._isEditState;
                });
              })
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(bottom: ScreenAdapter.height(87)),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return CartListItem(
                      context.watch<CartProvider>().cartList[index]);
                },
                itemCount: context.watch<CartProvider>().cartList.length,
              )),
          Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(10), 0, ScreenAdapter.width(10), 0),
                height: ScreenAdapter.height(85),
                width: ScreenAdapter.width(ScreenAdapter.designWidth()),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        top: BorderSide(
                            color: Colors.black12,
                            width: ScreenAdapter.height(2)))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                            child: Checkbox(
                              value: context.watch<CartProvider>().isSelectAll,
                              onChanged: (value) {
                                context
                                    .read<CartProvider>()
                                    .changeSelectAllState(value);
                              },
                              activeColor: Colors.red,
                            ),
                            width: ScreenAdapter.width(90),
                            padding: EdgeInsets.only(
                                right: ScreenAdapter.width(10))),
                        Text("全选"),
                        SizedBox(
                          width: ScreenAdapter.width(20),
                        ),
                        this._isEditState == false ?   Text("总价：") : Text(""),
                       this._isEditState == false ?  Text(
                         "¥${context.watch<CartProvider>().totalPrice}",
                         style: TextStyle(
                             color: Colors.red,
                             fontSize: ScreenAdapter.fontSize(40)),
                       ) : Text(""),
                      ],
                    ),
                    RawMaterialButton(
                      onPressed: () {
                        if (this._isEditState) {
                          //删除
                          context.read<CartProvider>().deleteSelectedCartItem();
                        } else {
                          //结算
                        }
                      },
                      fillColor: Colors.red,
                      child: Text(
                        "${this._isEditState ? "删除" : "结算"}",
                        style: TextStyle(color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
