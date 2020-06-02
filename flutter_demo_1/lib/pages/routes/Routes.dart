import 'package:flutter/material.dart';
import 'package:flutterdemo1/pages/datePub.dart';
import '../Tabs.dart';
import '../FormPage.dart';
import '../users/LoginPage.dart';
import '../users/RegisterFirstPage.dart';
import '../users/RegisterSecondPage.dart';
import '../users/RegisterThirdPage.dart';
import '../TabBarController.dart';
import '../date.dart';
import '../datePub.dart';
import '../Swiper.dart';
import '../DialogDemo.dart';


final routes = {
  "/": (context, {arguments}) => Tabs(arguments: arguments),
  '/formPage': (context, {arguments}) => FormPage(arguments: arguments),
  '/loginPage': (context, {arguments}) => LoginPage(),
  '/registerFirstPage': (context, {arguments}) => RegisterFirstPage(),
  '/registerSecondPage': (context, {arguments}) => RegisterSecondPage(),
  '/registerThirdPage': (context, {arguments}) => RegisterThirdPage(),
  '/tabBarController': (context, {arguments}) => TabBarControllerPage(),
  '/date': (context, {arguments}) => DatePubDemo(),
  '/swiper': (context, {arguments}) => SwiperDemo(),
  '/dialog': (context, {arguments}) => DialogDemo(),
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
