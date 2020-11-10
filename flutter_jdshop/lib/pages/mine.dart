import 'package:flutter/material.dart';
import '../services/screenAdapter.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MinePageState();
  }
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    // TODO: implement build
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(ScreenAdapter.width(30)),
          height: ScreenAdapter.height(220),
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/user_bg.jpg"), fit: BoxFit.cover)),
          child: Row(
            children: <Widget>[
              ClipOval(
                child: Image.asset(
                  "images/user.png",
                  fit: BoxFit.cover,
                  width: ScreenAdapter.width(100),
                  height: ScreenAdapter.height(100),
                ),
              ),
              SizedBox(
                width: ScreenAdapter.width(20),
              ),
//              Expanded(
//                  flex: 1,
//                  child: Text(
//                    "登录/注册",
//                    style: TextStyle(color: Colors.white),
//                  ))
              Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "用户名：18823412344",
                        style: TextStyle(color: Colors.white, fontSize: ScreenAdapter.fontSize(32)),
                      ),
                      Text(
                        "普通会员",
                        style: TextStyle(color: Colors.white, fontSize: ScreenAdapter.fontSize(24)),
                      )
                    ],
                  ))
            ],
          ),
        ),
        ListTile(
          leading: Icon(Icons.assignment, color: Colors.red),
          title: Text("全部订单"),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.payment, color: Colors.green),
          title: Text("待付款"),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.local_car_wash, color: Colors.orange),
          title: Text("待收货"),
        ),
        Container(
            width: double.infinity,
            height: 10,
            color: Color.fromRGBO(242, 242, 242, 0.9)),
        ListTile(
          leading: Icon(Icons.favorite, color: Colors.lightGreen),
          title: Text("我的收藏"),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.people, color: Colors.black54),
          title: Text("在线客服"),
        ),
        Divider(),
      ],
    ));
  }
}
