import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("demo"),
        ),
        body: HomeContent(),
      ),
      theme: ThemeData(primaryColor: Colors.yellow),
    );
  }
}

class HomeContent extends StatelessWidget {

  Widget _getHomeContentData(context, index) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          AspectRatio(aspectRatio: 16.0/7.0,child: Image.network("https://img.mukewang.com/5ec48c410001629d18720764.jpg", fit: BoxFit.contain,)),
          ListTile(
            title: Text("xxxxxxxxxxx"),
            subtitle: Text("XXXXXXXXXXXXXXXXX"),
            leading: CircleAvatar(backgroundImage: NetworkImage("https://img3.mukewang.com/szimg/5ea0118b0948c90a12000676-360-202.png"))
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: ListView.builder(itemBuilder: this._getHomeContentData,itemCount: 2,),
    );
  }
}
