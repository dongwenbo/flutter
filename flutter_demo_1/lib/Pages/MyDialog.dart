import 'dart:async';

import 'package:flutter/material.dart';

class MyDialog extends Dialog {
  _showTimer(context) {
    var timer;
    timer = Timer.periodic(Duration(milliseconds: 3000), (t) {
      if(context != null) {
        print("asdfasd");
        Navigator.of(context).pop();
      }
      t.cancel();
      timer = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    _showTimer(context);
    // TODO: implement build
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container (
          height: 300.0,
          width: 300.0,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 2.0), child: Stack(children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Text("提示"),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(child: Icon(Icons.close,), onTap: (){
                    Navigator.pop(context);
                  },),
                )
              ],)),
              Divider(),
              Container(
                width: double.infinity,
                child: Text("内容", textAlign: TextAlign.left,),
              )
            ],
          ),
        ),

      ),
    );
  }
}