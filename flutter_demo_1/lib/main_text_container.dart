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
      child: Container(
        child: Text(
          "hello",
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          textScaleFactor: 2.0,
          style: TextStyle(
              fontSize: 15.0, color: Colors.red, fontWeight: FontWeight.bold),
        ),
        height: 300.0,
        width: 300.0,
        decoration: BoxDecoration(
            color: Colors.yellow,
            border: Border.all(color: Colors.blue, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        padding: EdgeInsets.all(20.0),
//        transform: Matrix4.rotationZ(radians),
        alignment: Alignment.topRight,
      ),
    );
  }
}
