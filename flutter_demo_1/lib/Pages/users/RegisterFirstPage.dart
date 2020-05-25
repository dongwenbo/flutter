import 'package:flutter/material.dart';

class RegisterFirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("注册第一步"),
        ),
        body: Center(
          child: RaisedButton(onPressed: (){
            Navigator.of(context).pushNamed("/registerSecondPage");
//            Navigator.of(context).pushReplacementNamed("/registerSecondPage");
          },child: Text("下一步"),),
        ),
    );
  }
}
