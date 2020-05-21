import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  String title;
  FormPage({this.title = "表单页面"});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title:  Text(this.title),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).pop();
      },child: Text("返回"),),
    );
  }
}