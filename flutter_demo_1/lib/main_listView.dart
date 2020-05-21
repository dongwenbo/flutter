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
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              color: Colors.blue,
              width: 180.0,
            ),
            Container(
              color: Colors.red,
              width: 180.0,
            ),
            Container(
              color: Colors.yellow,
              width: 180.0,
            )
          ],
        ),
        height: 180.0,
      ),
    );
  }
}
