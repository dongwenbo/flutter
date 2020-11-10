import 'package:flutter/material.dart';

class ProductContentThirdPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductContentThirdState();
  }
}

class _ProductContentThirdState extends State<ProductContentThirdPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text("评价");
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}