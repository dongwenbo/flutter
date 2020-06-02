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
      body: Center(
        child: RaisedButton(onPressed: (){
          Navigator.pushNamed(context, "/formPage",
              arguments: {"formId": "1234"});
        }),
      ),

    );
  }
}
