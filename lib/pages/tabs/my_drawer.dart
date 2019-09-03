import 'package:flutter/material.dart';
import 'dart:ui';
import '../../components/values/dimens.dart';
/**
 * Author: YongChao
 * Date: 19-9-2 下午2:50
 * Description: 侧滑菜单
 */

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, MediaQueryData.fromWindow(window).padding.top, 0, 0),
      color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Divider(
            color: Colors.transparent,
            height: 40,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(Dimens.drawerLeftMargin, 0.0, 14, 0.0),
                decoration: ShapeDecoration(
                    shape: CircleBorder(
                      side: BorderSide(color: Colors.white,width: Dimens.avatarBorder,style: BorderStyle.solid),
                    )
                ),
                child: CircleAvatar(
                  radius: Dimens.avatarSize,
                  backgroundImage: NetworkImage("http://192.168.10.42:8080/MyDemo/aa/ab.jpg"),
                ),
              ),
              Text("徐铭",style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),),
            ],
          ),
          Divider(
            color: Colors.transparent,
            height: 20,
          ),
          DrawerDivider(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.fromLTRB(0.0,4.0,0.0,4.0),
              children: <Widget>[
                DrawerItem(Icon(Icons.account_balance), '修改密码',onTap: (){Navigator.pop(context);},),
                DrawerItem(Icon(Icons.account_balance), '免打扰模式',onTap: (){Navigator.pop(context);},),
                DrawerItem(Icon(Icons.account_balance), '意见反馈',onTap: (){Navigator.pop(context);},),
                DrawerDivider(),
                DrawerItem(Icon(Icons.account_box), '关于我们',onTap: (){Navigator.pop(context);},),
                DrawerItem(Icon(Icons.account_balance), '服务条款',onTap: (){Navigator.pop(context);},),
                DrawerItem(Icon(Icons.account_balance,color: Colors.white), '版本信息',subTitle: "已是最新版本",onTap: (){Navigator.pop(context);},),
              ],
            ),
            flex: 1,
          ),
          DrawerDivider(),
          Container(
            margin: EdgeInsets.fromLTRB(Dimens.drawerLeftMargin,16.0,0.0,16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('010-85072155',style: TextStyle(color: Colors.white,fontSize: 20.0,)),
                Divider(
                  color: Colors.transparent,
                  height: 3,
                ),
                Text('服务器时间： 早上9点至晚上18点',style:TextStyle(color: Colors.white,fontSize: 12.0)),
              ],
            ),
          ),
          DrawerDivider(),
          GestureDetector(
            onTap: (){Navigator.pop(context);},
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.fromLTRB(0, 30, 0, 30.0),
              alignment: Alignment.center,
              child: Text('退出登录' ,style:TextStyle(color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }
}


class DrawerDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: Dimens.avatarDividerHeight,
      color: Colors.white,
      indent: Dimens.drawerLeftMargin,
    );
  }
}

class ListDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: Dimens.avatarDividerHeight,
      color: Colors.white,
    );
  }
}


class DrawerItem extends StatefulWidget {
  final Widget leading;
  final String title;
  final String subTitle;
  final GestureTapCallback onTap;

  const DrawerItem(
      this.leading,
      this.title,
      {
        Key key,
        this.subTitle,
        this.onTap
      }) : super(key: key);
  @override
  _DrawerItemState createState() => _DrawerItemState(leading,title,subTitle,onTap);
}

class _DrawerItemState extends State<DrawerItem> {
  final Widget leading;
  final String title;
  final String subTitle;
  final GestureTapCallback onTap;
  bool _isClick = false;

  _DrawerItemState(this.leading, this.title, this.subTitle, this.onTap);


  void _onClick(bool b) {
    setState(() {
      _isClick = b;
    });
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onTapUp: (TapUpDetails details){_onClick(false);},
      onTapDown:  (TapDownDetails details){_onClick(true);},
      child: Container(
        height: 50.0,
        padding: EdgeInsets.only(right: 20.0),
        decoration: BoxDecoration(
          color: _isClick?Colors.black38:Colors.transparent
        ),
        child: Row(
          children: <Widget>[
            VerticalDivider(
              width: Dimens.drawerLeftMargin,
              color: Colors.transparent,
            ),
            leading,
            VerticalDivider(
              width: 10,
              color: Colors.transparent,
            ),
            Text(title,style: TextStyle(fontSize: 20,color: Colors.white),),
            VerticalDivider(
              width: 6,
              color: Colors.transparent,
            ),
            Container(
              padding: EdgeInsets.only(top: 6),
              child: Text(subTitle==null?"":subTitle,style: TextStyle(fontStyle: FontStyle.italic,color: Colors.white),),
            ),
            Expanded(
              child: VerticalDivider(
                width: 1,
              ),
              flex: 1,
            ),
            Icon(Icons.arrow_forward_ios,color: Colors.white,size: 16,)
          ],
        ),
      ),
    );
  }
}

