import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("登录"),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {},
                    child: Text("按钮"),
                    textColor: Colors.yellow,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  RaisedButton(
                    onPressed: () {},
                    child: Text("阴影按钮"),
                    elevation: 10,
                  ),
                  SizedBox(width: 10,),
                  RaisedButton.icon(onPressed: (){}, icon: Icon(Icons.add), label: Text("图标按钮")),
                  SizedBox(width: 10,),
                  RaisedButton(
                    onPressed: (){

                    },
                    child: Text("圆角按钮"),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text("按钮"),
                      textColor: Colors.yellow,
                      color: Colors.red,
                    ),
                    height: 100,
                    width: 100,
                  )
                ],
              ),
              Row(children: <Widget>[
                Expanded(
                    child: RaisedButton(
                        onPressed: () {},
                        child: Text("按钮"),
                        textColor: Colors.yellow,
                        color: Colors.red))
              ]),
              Row(children: <Widget>[
               Container(
                 height: 100.0,
                 child: RaisedButton(
                   onPressed: (){

                   },
                   child: Text("圆形按钮"),
                   shape: CircleBorder(
                       side: BorderSide(color: Colors.red)
                   ),
                 ),
               )
              ],)
            ]));
  }
}
