import 'package:flutter/material.dart';
import '../../provider/cartProvider.dart';
import '../../services/screenAdapter.dart';
import 'cartListItemCount.dart';
import 'package:provider/provider.dart';

class CartListItem extends StatefulWidget {
  final Map _itemData;

  CartListItem(this._itemData);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CartListItemState();
  }
}

class _CartListItemState extends State<CartListItem> {
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    // TODO: implement build
    return Container(
      height: ScreenAdapter.height(220),
      width: ScreenAdapter.width(ScreenAdapter.designWidth()),
      margin: EdgeInsets.all(ScreenAdapter.width(10)),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(
                  color: Colors.black12, width: ScreenAdapter.height(2)))),
      child: Row(
        children: <Widget>[
          Container(
              child: Checkbox(
                value: widget._itemData["checked"],
                onChanged: (value) {
                  widget._itemData["checked"] = value;
                  context.read<CartProvider>().changeCartListData();
                  context.read<CartProvider>().judgeSelectAllState();
                },
                activeColor: Colors.red,
              ),
              width: ScreenAdapter.width(90),
              padding: EdgeInsets.only(right: ScreenAdapter.width(10))),
          Container(
            width: ScreenAdapter.width(120),
            child:
                Image.network("${widget._itemData["pic"]}", fit: BoxFit.cover),
          ),
          Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(40),
                    ScreenAdapter.height(20),
                    ScreenAdapter.height(10),
                    ScreenAdapter.height(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("${widget._itemData["title"]}", maxLines: 2),
                    Text("${widget._itemData["selectAttrString"]}",
                        maxLines: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Text("¥${widget._itemData["price"]}"),
                        ),
                        CartListItemCount(
                            count: widget._itemData["count"],
                            addHandle: () {
                              widget._itemData["count"] += 1;
                              context.read<CartProvider>().changeCartListData();
                            },
                            deleteHandle: () {
                              if (widget._itemData["count"] > 1) {
                                widget._itemData["count"] -= 1;
                                context
                                    .read<CartProvider>()
                                    .changeCartListData();
                              }
                            })
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
