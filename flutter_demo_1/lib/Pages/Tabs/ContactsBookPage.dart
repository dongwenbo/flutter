import 'package:flutter/material.dart';
import '../FormPage.dart';
class ContactsBookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text("进入表单页面"),
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>FormPage(title: "页面传值",))
          );
        },
      ),
    );
  }
}