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
//        child: Image.network(
//          "https://img.mukewang.com/5ec48c410001629d18720764.jpg",
////          color: Colors.blue,
////          colorBlendMode: BlendMode.difference,
//          fit: BoxFit.contain,
//        ),
//        height: 300.0,
//        width: 300.0,
//        decoration: BoxDecoration(
//            color: Colors.yellow,
//            border: Border.all(color: Colors.blue, width: 1.0),
//            borderRadius: BorderRadius.circular(150.0),
//            image: DecorationImage (
//                image: NetworkImage("https://img.mukewang.com/5ec48c410001629d18720764.jpg"),
//                fit: BoxFit.cover
//            )
//        ),
//        padding: EdgeInsets.all(20.0),
//        transform: Matrix4.rotationZ(radians),
//        alignment: Alignment.bottomRight,
        child: ClipOval(
            child: Image.asset(
          "images/loading.png",
          width: 200.0,
          height: 200.0,
          fit: BoxFit.cover,
        )),
      ),
    );
  }
}
