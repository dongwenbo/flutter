import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("设置")
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(onPressed: (){
              Navigator.of(context).pushNamed("/loginPage");
            },child: Text("登录"),),
            RaisedButton(onPressed: (){
              Navigator.of(context).pushNamed("/registerFirstPage");
            },child: Text("注册"),)
          ],
        ),
      ),
    );
  }
}