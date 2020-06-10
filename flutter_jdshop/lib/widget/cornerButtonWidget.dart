import 'package:flutter/material.dart';
import '../services/screenAdapter.dart';

class CornerButtonWidget extends StatelessWidget {
  final String title;
  final Color bgColor;
  final Object callbackHandle;
  CornerButtonWidget({Key key, this.bgColor = Colors.black ,this.title = "按钮",this.callbackHandle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    // TODO: implement build
    return InkWell(
      child:  Container(
        margin: EdgeInsets.fromLTRB(ScreenAdapter.width(20), 0, ScreenAdapter.width(20), 0),
        alignment: Alignment.center,
        height: ScreenAdapter.height(65),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: this.bgColor,
        ),
        child: Text("${this.title}", style: TextStyle(color: Colors.white)),
      ),
      onTap: this.callbackHandle,
    );
  }
}