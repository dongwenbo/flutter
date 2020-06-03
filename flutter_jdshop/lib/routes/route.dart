import 'package:flutter/material.dart';
import '../pages/tabs.dart';
import '../pages/search.dart';
import '../pages/productList.dart';

final routes = {
  '/' : (context, {arguments}) => Tabs(),
  '/search' : (context, {arguments}) => SearchPage(),
  '/productList' : (context, {arguments}) => ProductListPage(arguments: arguments),
};
// 生成路由回调的的固定写法
Function onGenerateRoute = (RouteSettings setting) {
  final String name = setting.name;
  final Function pagContentBuilder = routes[name];
  if (pagContentBuilder != null) {
    if (setting.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pagContentBuilder(context, arguments: setting.arguments));
      return route;
    } else {
      final Route route =
      MaterialPageRoute(builder: (context) => pagContentBuilder(context));
      return route;
    }
  }
  return null;
};