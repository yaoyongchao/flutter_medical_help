import 'package:flutter/material.dart';

/**
 * Author: YongChao
 * Date: 19-9-2 上午11:08
 * Description: 首页
 */
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('诊所'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 140.00,
            color: Colors.lightBlue,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TopMenu(
                      '门诊预约', 'http://192.168.10.42:8080/MyDemo/aa/ab.jpg'),
                  flex: 1,
                ),
                Expanded(
                  child: Container(
                    color: Colors.amber,
                    child: TopMenu(
                        '图文咨询', 'http://192.168.10.42:8080/MyDemo/aa/ab.jpg'),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Container(
                    color: Colors.red,
                    child: TopMenu(
                        '电话咨询', 'http://192.168.10.42:8080/MyDemo/aa/ab.jpg',onTap: (){print("111");},),
                  ),
                  flex: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TopMenu extends StatelessWidget {
  final String imgUrl;
  final String title;
  final GestureTapCallback onTap;

  TopMenu(this.title,this.imgUrl, {Key key,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 36.0),
        color: Colors.red,
        child: Column(
          children: <Widget>[
            Image(
              image: NetworkImage(imgUrl),
              width: 40,
              height: 40,
            ),
            Divider(
              color: Colors.transparent,
              height: 14.0,
            ),
            Text(
              title == null ? "" : title,
              style: TextStyle(color: Colors.white, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
