import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  final String title;
  final arguments;
  FormPage({this.title = "表单页面",this.arguments});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FormPageState(arguments: this.arguments);
  }
}
class _FormPageState extends State<StatefulWidget> {
  final Map arguments;
  _FormPageState({this.arguments});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Map arguments1 = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("formId=${arguments["formId"]}"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).pop();
      }, child: Text("返回"),),
    );
  }
}