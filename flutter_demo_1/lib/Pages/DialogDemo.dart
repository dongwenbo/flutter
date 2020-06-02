import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'MyDialog.dart';

class DialogDemo extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DialogDemoState();
  }

}


class DialogDemoState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    _showDialog() {
      showDialog(
          context: context,
          builder: (context) {
            return MyDialog();

//              AlertDialog(
//                title: Text("提示"),
//                content: Text("提示信息"),
//                actions: <Widget>[
//                  FlatButton(
//                      onPressed: () {
//                        Navigator.of(context).pop();
//                      },
//                      child: Text("取消")),
//                  FlatButton(
//                      onPressed: () {
//                        Navigator.of(context).pop();
//                      },
//                      child: Text("确定")),
//                ],
//              );
          });
    }

    _showSimpleDialog() {
      showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              title: Text("提示"),
              children: <Widget>[
                SimpleDialogOption(child: Text("option A"), onPressed: () {Navigator.of(context).pop();}),
                SimpleDialogOption(
                  child: Text("option B"),
                  onPressed: () {Navigator.of(context).pop();},
                ),
                SimpleDialogOption(
                  child: Text("option C"),
                  onPressed: () {Navigator.of(context).pop();},
                )
              ],
            );
          });
    }

    _showModelBottomActionSheet() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          child: Column(children: <Widget>[
            ListTile(title: Text("分享 1"), onTap: () {
              Navigator.of(context).pop();
            },),
            ListTile(title: Text("分享 1"), onTap: () {
              Navigator.of(context).pop();
            },),
            ListTile(title: Text("分享 1"), onTap: () {
              Navigator.of(context).pop();
            },)
          ],),
        );
      });
    }
    _showLongToast() {
      Fluttertoast.showToast(
        msg: "This is Long Toast",
        gravity:ToastGravity.CENTER,
        toastLength: Toast.LENGTH_LONG,
      );
    }
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("弹框"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: _showDialog,
              child: Text("alertDialog"),
            ),
            RaisedButton(
              onPressed: _showSimpleDialog,
              child: Text("simpleDialog"),
            ),
            RaisedButton(
              onPressed: _showModelBottomActionSheet,
              child: Text("bottomActionSheet"),
            ),
            RaisedButton(
              onPressed: _showLongToast,
              child: Text("toast"),
            ),
          ],
        ),
      ),
    );
  }
}