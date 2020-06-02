import 'package:flutter/material.dart';


class HomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("首页")
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(onPressed: (){
              Navigator.of(context).pushNamed("/tabBarController");
            }),
            RaisedButton(onPressed: (){
              Navigator.of(context).pushNamed("/date");
            },child: Text("时间"),),
            RaisedButton(onPressed: (){
              Navigator.of(context).pushNamed("/swiper");
            },child: Text("轮播"),),
            RaisedButton(onPressed: (){
              Navigator.of(context).pushNamed("/dialog");
            },child: Text("弹框"),)
          ],
        ),
      ),
    );
  }
}
