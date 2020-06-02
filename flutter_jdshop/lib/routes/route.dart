import 'package:flutter/material.dart';
import '../pages/tabs.dart';
import '../pages/search.dart';

final routes = {
  '/' : (context, {arguments}) => Tabs(),
  '/search' : (context, {arguments}) => SearchPage(),
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