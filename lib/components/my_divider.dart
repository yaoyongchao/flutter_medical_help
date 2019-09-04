import 'package:flutter/material.dart';

/**
 * Author: YongChao
 * Date: 19-9-4 上午9:29
 * Description: 分割线
 */

class MyDividerH extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.black26,
      height: 2.0,
    );
  }
}


class MyDividerV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VerticalDivider(
      color: Colors.black26,
      width: 2.0,
    );
  }
}