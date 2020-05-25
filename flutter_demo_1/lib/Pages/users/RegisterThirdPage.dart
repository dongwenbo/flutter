import 'package:flutter/material.dart';

class RegisterThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("注册第三步"),
        ),
        body: Center(
          child: RaisedButton(onPressed: (){
//            Navigator.of(context).pop();
          Navigator.of(context).pushNamedAndRemoveUntil("/",(route){
            return route == null;
          },arguments: {"index":1});
          },child: Text("完成"),),
        ),
      );
  }
}
