import 'package:flutter/material.dart';
import '../pages/tabs/tabs.dart';
import '../pages/tabs/main_home.dart';

/**
 * 配置路由，第一步配置路由
 */
final routes = {
  '/': (context,{arguments}) => Tabs(),

};

//固定写法
var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
      MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};