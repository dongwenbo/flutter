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
      child: Column(
        children: <Widget>[
          Image.network(
              "https://img.mukewang.com/5ec48c410001629d18720764.jpg"),
          SizedBox(height: 10),
          Text("asdfasdfasdf")
        ],
      ),
      decoration: BoxDecoration(border: Border.all(color: Colors.blue, width: 1.0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: GridView.builder(
        padding: EdgeInsets.all(10.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 10.0, crossAxisSpacing: 20.0),
          itemCount: 10,
          itemBuilder: this._getHomeContentData),
    );
  }
}
