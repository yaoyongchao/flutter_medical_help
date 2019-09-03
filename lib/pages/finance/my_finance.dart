import 'package:flutter/material.dart';

/**
 * Author: YongChao
 * Date: 19-9-2 上午11:18
 * Description: 我的财务
 */

class MyFinance extends StatefulWidget {
  @override
  _MyFinanceState createState() => _MyFinanceState();
}

class _MyFinanceState extends State<MyFinance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的财务'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("我的财务")
        ],
      ),
    );
  }
}
