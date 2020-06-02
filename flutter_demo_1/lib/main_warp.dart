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
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Wrap(
          spacing: 10,
          children: <Widget>[
            MyButton("asdfasdfasdf"),
            MyButton("ew"),
            MyButton("asdfasdfasdf"),
            MyButton("asdfawerwesdfdf"),
            MyButton("asdfasdfasdf"),
            MyButton("asdfaswerdfasdf"),
            MyButton("sa"),
            MyButton("asdfasdfasdf"),
            MyButton("assdfasdf"),
            MyButton("wsewer"),
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String text;

  const MyButton(this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
        child: Text(this.text),
        textColor: Theme
            .of(context)
            .accentColor,
        onPressed: null);
  }
}
