import 'package:flutter/material.dart';
import 'package:flutter_medical_help/values/dimens.dart';
import '../../components/my_head.dart';
/**
 * Author: YongChao
 * Date: 19-9-2 上午11:07
 * Description: 我的页面
 */

class Mine extends StatefulWidget {
  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.asset('lib/images/grzx_bg.png',fit: BoxFit.fill,),
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(Dimens.defaultMargin),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: MyHead(),
                          flex: 1,
                        ),
                        Text('个人资料  ',style: TextStyle(color: Colors.white),),
                        Icon(Icons.arrow_forward_ios,size: Dimens.arrowSize,color: Colors.white,)
                      ],
                    ),
                  ),
                  Divider(color: Colors.white,height: Dimens.defaultDivider,),
                  Container(
                    color: Colors.red,
                    child: Row(
                      children: <Widget>[

                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
