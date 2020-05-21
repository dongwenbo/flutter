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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: Container(height: 200.0, color: Colors.black), flex: 1)
            ],
          ),
          SizedBox(height: 10.0,),
          Row(
            children: <Widget>[
              Expanded(
                child: Image.network(
                  "https://img.mukewang.com/5ec48c410001629d18720764.jpg",
                  height: 180.0,
                  fit: BoxFit.cover,
                ),
                flex: 2,
              ),
              SizedBox(width: 10.0),
              Expanded(
                child: Container(
                  child: ListView(
                    children: <Widget>[
                      Image.network(
                        "https://img.mukewang.com/5ec48c410001629d18720764.jpg",
                        height: 85.0,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Image.network(
                        "https://img.mukewang.com/5ec48c410001629d18720764.jpg",
                        height: 85.0,
                        fit: BoxFit.cover
                      )
                    ],
                  ),
                  height: 180.0,
                ),
                  flex: 1
              )
            ],
          )
        ],
      ),
    );
  }
}
