import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CartPageState();
  }
}
class _CartPageState extends State<StatefulWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("cart");
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text("购物车");
  }
}
