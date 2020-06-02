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
  var username = new TextEditingController();
  var flag = false;
  int sex = 1;
  List hobbyList = [
    {
      "checkFlag" : true,
      "title" : "吃饭"
    },
    {
      "checkFlag" : false,
      "title" : "睡觉"
    },
    {
      "checkFlag" : true,
      "title" : "写代码"
    },
  ];

  List<Widget> _getHobbyWidgetList() {
    List<Widget> tempList = new List();
    for (var i = 0; i < hobbyList.length; i++) {
      tempList.add(
          Row(
            children: <Widget>[
              Text(hobbyList[i]["title"]),
              Checkbox(
                value: hobbyList[i]["checkFlag"],
                onChanged: (value) {
                  setState(() {
                    hobbyList[i]["checkFlag"] = value;
                  });
                },
              )
            ],
          )
      );
    }
    return tempList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    username.text = "初始值";
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Map arguments1 = ModalRoute
        .of(context)
        .settings
        .arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("formId=${arguments["formId"]}"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).pop();
      }, child: Text("返回"),),
//      body: TextFiledDemo()
    body: Column(
      children: <Widget>[
        TextField(
          onChanged: (value){
            setState(() {
              username.text = value;
            });
          },
          controller: username,
          decoration: InputDecoration(
              hintText: "请输入文字",
              border: OutlineInputBorder()
          ),
        ),
        SizedBox(height: 10.0,),
        RaisedButton(onPressed: (){
          print(username.text);
          print(this.hobbyList);
        }, child: Text("提交"),),
        SizedBox(height: 10.0,),
        Checkbox(value: this.flag, onChanged: (value){
          setState(() {
            this.flag = value;
          });
        },activeColor: Colors.red,),
        CheckboxListTile(value: this.flag, onChanged: (value){
          setState(() {
            this.flag = value;
          });
        },title: Text("asdf"),subtitle: Text("data"),secondary: Icon(Icons.flag),),
        SizedBox(height: 10.0,),
        Row(
          children: <Widget>[
            Text("男"),
            Radio(value: 1, groupValue: this.sex, onChanged: (value){
              setState(() {
                this.sex = value;
              });
            }),
            SizedBox(width: 10,),
            Text("女"),
            Radio(value: 2, groupValue: this.sex, onChanged: (value){
              setState(() {
                this.sex = value;
              });
            })
          ],
        ),
        SizedBox(height: 10,),
        Column(
          children: this._getHobbyWidgetList(),
        )
      ],
    ),
    );
  }
}

class TextFiledDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: <Widget>[
      TextField(
        decoration: InputDecoration(
            hintText: "请输入文字",
            border: OutlineInputBorder()
        ),
      ),
      SizedBox(height: 10.0,),
      TextField(
        decoration: InputDecoration(
            hintText: "请输入文字",
            border: OutlineInputBorder()
        ),
      ),
      SizedBox(height: 10.0,),
      TextField(
        maxLines: 4,
        decoration: InputDecoration(
            hintText: "请输入文字",
            border: OutlineInputBorder()
        ),
      ),
      SizedBox(height: 10.0,),
      TextField(
        obscureText: true,
        decoration: InputDecoration(
            hintText: "请输入文字",
            border: OutlineInputBorder()
        ),
      ),
      SizedBox(height: 10.0,),
      TextField(
        obscureText: true,
        decoration: InputDecoration(
            labelText: "密码",
            hintText: "请输入文字",
            border: OutlineInputBorder()
        ),
      ),
      SizedBox(height: 10.0,),
      TextField(
        obscureText: true,
        decoration: InputDecoration(
            icon: Icon(Icons.panorama_fish_eye),
            labelText: "密码",
            hintText: "请输入文字",
            border: OutlineInputBorder()
        ),
      )
    ],);
  }

}