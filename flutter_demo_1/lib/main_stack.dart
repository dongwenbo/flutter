import 'dart:ui';

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
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            child: Image.network(
              "https://img.mukewang.com/5e683fad000185c518720764.jpg",
              height: 60,
              fit: BoxFit.cover,
            ),
            top: 0,
          ),
          Positioned(child: Text("图片"), bottom: 10)
        ],
      ),
      height: 100.0,
      decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 1.0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: ListView.builder(
        itemBuilder: this._getHomeContentData,
        itemCount: 3,
      ),
    );
  }
}
