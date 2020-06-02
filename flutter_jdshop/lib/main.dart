import 'package:flutter/material.dart';
import 'routes/route.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        initialRoute: '/',
        onGenerateRoute: onGenerateRoute,
    );
  }
}