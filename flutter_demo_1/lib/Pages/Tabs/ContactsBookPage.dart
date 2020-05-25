import 'package:flutter/material.dart';
import '../FormPage.dart';

class ContactsBookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("通讯录"),
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.settings), onPressed: () {}),
          IconButton(icon: Icon(Icons.add), onPressed: () {})
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("进入表单页面"),
        onPressed: () {
//          Navigator.of(context).push(
//            MaterialPageRoute(builder: (context)=>FormPage(title: "页面传值",))
//          );
          Navigator.pushNamed(context, "/formPage",
              arguments: {"formId": "1234"});
        },
      ),
    );
  }
}
