import 'package:flutter/material.dart';

class RegisterSecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("注册第二步"),
        ),
        body: Center(
          child: RaisedButton(onPressed: (){
            Navigator.of(context).pushNamed("/registerThirdPage");
//          Navigator.of(context).pushReplacementNamed("/registerThirdPage");
          },child: Text("下一步"),),
        ),
      );
  }
}
