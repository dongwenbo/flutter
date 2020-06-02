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

  Widget _getHomeContent(context, index) {
    return ListTile(title: Text("asdfasdf"),);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: this._getHomeContent),
    );
  }
}
