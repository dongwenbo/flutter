import 'package:flutter/material.dart';
import '../../services/screenAdapter.dart';

class CartListItemCount extends StatefulWidget {
 final Function addHandle;
 final Function deleteHandle;
 final int count;
  CartListItemCount({@required this.count, @required this.addHandle, @required this.deleteHandle});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CartListItemCountState();
  }
}

class _CartListItemCountState extends State<CartListItemCount> {
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12, width: ScreenAdapter.width(2))
      ),
      child: Row(
        children: <Widget>[
          InkWell(
            child: Container(
                height: ScreenAdapter.height(50),
                width: ScreenAdapter.width(50),
                child: Center(child: Text("-"),),
                decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(
                            color: Colors.black12,
                            width: ScreenAdapter.width(2))))),
            onTap: widget.deleteHandle,
          ),
          Container(
            height: ScreenAdapter.height(50),
            width: ScreenAdapter.width(72),
            child: Center(child: Text("${widget.count}"),),
          ),
          InkWell(
            child: Container(
              height: ScreenAdapter.height(50),
              width: ScreenAdapter.width(50),
              child: Center(child: Text("+"),),
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(
                          color: Colors.black12,
                          width: ScreenAdapter.width(2)))),
            ),
            onTap: widget.addHandle,
          )
        ],
      ),
    );
  }
}
