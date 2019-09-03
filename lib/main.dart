import 'package:flutter/material.dart';
import 'package:flutter_medical_help/routers/routers.dart' as prefix0;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',//初始化的时候加载路由
      debugShowCheckedModeBanner: false,
      onGenerateRoute: prefix0.onGenerateRoute,
    );
  }
}
