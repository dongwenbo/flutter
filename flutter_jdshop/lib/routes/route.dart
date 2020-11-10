import 'package:flutter/material.dart';
import '../pages/tabs.dart';
import '../pages/search.dart';
import '../pages/productList.dart';
import '../pages/productContent.dart';
import '../pages/cart.dart';

final routes = {
  '/' : (context, {arguments}) => Tabs(),
  '/search' : (context, {arguments}) => SearchPage(),
  '/productList' : (context, {arguments}) => ProductListPage(arguments: arguments),
  '/productContent' : (context, {arguments}) => ProductContentPage(arguments: arguments),
  '/cart' : (context, {arguments}) => CartPage()
};
// 生成路由回调的的固定写法
Function onGenerateRoute = (RouteSettings setting) {
  final String name = setting.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (setting.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: setting.arguments));
      return route;
    } else {
      final Route route =
      MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
  return null;
};