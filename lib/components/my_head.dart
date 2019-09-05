import 'package:flutter/material.dart';
import '../values/dimens.dart';

/**
 * Author: YongChao
 * Date: 19-9-5 上午10:06
 * Description: 头部组件
 */

class MyHead extends StatelessWidget {
  final String imgUrl;

  MyHead({this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(0, 0.0, 14, 0.0),
          decoration: ShapeDecoration(
              shape: CircleBorder(
                side: BorderSide(color: Colors.white,width: Dimens.avatarBorder,style: BorderStyle.solid),
              )
          ),
          child: CircleAvatar(
            radius: Dimens.avatarSize,
//            backgroundImage: NetworkImage("http://192.168.10.42:8080/MyDemo/aa/ab.jpg"),
            backgroundImage: NetworkImage(imgUrl==null?"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1470152423,3019904389&fm=26&gp=0.jpg":imgUrl),
          ),
        ),
        Text("徐铭",style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),),
      ],
    );
  }
}
