import 'package:flutter/material.dart';
import '../services/screenAdapter.dart';

class ProductListPage extends StatefulWidget {
  Map arguments = {};
  ProductListPage({Key key, this.arguments}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductListPageState();
  }
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("商品列表"),
      ),
      body: Container(
        padding: EdgeInsets.all(ScreenAdapter.height(20)),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Column(children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: ScreenAdapter.width(180),
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Image.network(
                        "https://www.itying.com/images/flutter/list2.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.only(left: ScreenAdapter.width(20)),
                        height: ScreenAdapter.height(180),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("戴尔(DELL)灵越3670 英特尔酷睿i5 高性能 台式电脑整机(九代i5-9400 8G 256G", maxLines: 2, overflow: TextOverflow.ellipsis),
                            Row(
                              children: <Widget>[
                                Container(
                                  height: ScreenAdapter.height(45),
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(right: ScreenAdapter.width(16)),
                                  padding: EdgeInsets.fromLTRB(ScreenAdapter.width(25), 0, ScreenAdapter.width(25), 0),
                                  child: Text("4g"),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(230, 230, 230, 0.9),
                                    borderRadius: BorderRadius.circular(ScreenAdapter.height(45) / 2)
                                  ),
                                ),
                                Container(
                                  height: ScreenAdapter.height(45),
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(right: ScreenAdapter.width(16)),
                                  padding: EdgeInsets.fromLTRB(ScreenAdapter.width(25), 0, ScreenAdapter.width(25), 0),
                                  child: Text("126"),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(230, 230, 230, 0.9),
                                      borderRadius: BorderRadius.circular(ScreenAdapter.height(45) / 2)
                                  ),
                                )
                              ],
                            ),
                            Text("¥180", style: TextStyle(color: Colors.red, fontSize: 16),)
                          ],
                        ),
                      ))
                ],
              ),
              Divider()
            ],);
          },
          itemCount: 20,
        ),
      ),
    );
  }
}
