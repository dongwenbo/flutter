import 'package:flutter/material.dart';
import '../services/screenAdapter.dart';
import '../services/searchService.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  String _keywords;
  List _historyList = [];

  _showAlertDialog(keyword) async {
    var result = await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            title: Text("提示信息!"),
            content: Text("您确定要删除吗?"),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context, 'Cancle');
                  },
                  child: Text("取消")),
              FlatButton(
                  onPressed: () async {
                    await SearchService.removeHistoryData(keyword);
                    this._getHistoryListData();
                    Navigator.pop(context, 'Ok');
                  },
                  child: Text("确定"))
            ],
          );
        });
  }

  _getHistoryListData() async {
    List historyList = await SearchService.getHistoryData();
    setState(() {
      this._historyList = historyList;
    });
  }

  Widget _searchHistoryListWidget() {
    if (this._historyList.length > 0) {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text("历史记录", style: Theme.of(context).textTheme.title),
            ),
            Divider(),
            Column(
              children: this._historyList.map((value) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      title: Text("$value"),
                      onLongPress: () {
                        this._showAlertDialog("$value");
                      },
                    ),
                    Divider()
                  ],
                );
              }).toList(),
            ),
            SizedBox(height: 100),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               InkWell(
                 onTap: () async {
                   await SearchService.clearHistoryList();
                   this._getHistoryListData();
                 },
                 child: Container(
                   width: ScreenAdapter.width(400),
                   height: ScreenAdapter.height(64),
                   decoration: BoxDecoration(
                       border: Border.all(color: Colors.black45, width: 1)),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[Icon(Icons.delete), Text("清空历史记录")],
                   ),
                 ),
               )
             ],
           )
          ]);
    } else {
      return Text("");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._getHistoryListData();
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: TextField(
            maxLines: 1,
            autofocus: false,
            decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none)),
            onChanged: (value) {
              this._keywords = value;
            },
          ),
          height: ScreenAdapter.height(68),
          decoration: BoxDecoration(
              color: Color.fromRGBO(233, 233, 233, 0.8),
              borderRadius: BorderRadius.circular(30)),
        ),
        actions: <Widget>[
          InkWell(
            child: Container(
              height: ScreenAdapter.height(68),
              width: ScreenAdapter.width(80),
              child: Row(
                children: <Widget>[Text("搜索")],
              ),
            ),
            onTap: () async {
              await SearchService.setHistoryData(this._keywords);
              FocusScope.of(context).requestFocus(FocusNode());
              Navigator.of(context).pushReplacementNamed("/productList",
                  arguments: {"keywords": this._keywords});
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(ScreenAdapter.width(20)),
        child: ListView(
          children: <Widget>[
            Container(
              child: Text(
                "搜索",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Divider(),
            Wrap(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(233, 233, 233, 0.9),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text("女装"),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(233, 233, 233, 0.9),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text("女装"),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(233, 233, 233, 0.9),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text("笔记本电脑"),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(233, 233, 233, 0.9),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text("女装111"),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(233, 233, 233, 0.9),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text("女装"),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(233, 233, 233, 0.9),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text("女装"),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(233, 233, 233, 0.9),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text("女装"),
                )
              ],
            ),
            SizedBox(height: 10),
            this._searchHistoryListWidget(),
          ],
        ),
      ),
    );
  }
}
