import 'package:flutter/material.dart';
import '../../values/dimens.dart';
import '../../components/my_divider.dart';
import '../../values/styles.dart';
import '../home/home_grid_view.dart';
import 'package:common_utils/common_utils.dart';

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
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Container(
            height: 130.00,
            child: Stack(
              overflow: Overflow.clip,
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: <Widget>[
                Image.asset("lib/images/home/sy_bj.png",fit: BoxFit.fill,),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: TopMenu(
                            '门诊预约', 'lib/images/home/sy_mzyy.png'),
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Container(
                        child: TopMenu(
                            '图文咨询', 'lib/images/home/sy_twzx.png'),
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Container(
                        child: TopMenu(
                          '电话咨询', 'lib/images/home/sy_dhzx.png',onTap: (){print("111");},),
                      ),
                      flex: 1,
                    ),
                  ],
                ),
              ],
            )
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(Dimens.defaultMargin, 10, Dimens.defaultMargin, 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                      children: <Widget>[
                        Text('今日新增关注 ',style: TextStyle(fontSize: 16,),),
                        Text('0',style: TextStyle(fontSize: 18,color: Colors.red,decoration: TextDecoration.underline),),
                        Text('人',style: TextStyle(fontSize: 16,),),
                      ],
                  ),
                  flex: 1,
                ),
                Text('补贴政策'),
                Icon(Icons.arrow_forward_ios,color: Colors.black26,size: 12,)
              ],
            ),
          ),
          MyDividerH(),
          Container(
            color: Colors.black26,
            child: GridView.count(
              crossAxisCount: 3,
              physics: new NeverScrollableScrollPhysics(),//增加
              shrinkWrap: true,//增加
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              childAspectRatio: 1.3,
              children: this._getItem(),
            ),
          ),
          MyDividerH(),
          Expanded(
            child: SizedBox(
              height: 1,
            ),
            flex: 1,
          )

        ],
      ),
    );
  }

  List<Widget> _getItem() {
    List listData = [
      {
        "title" : '自选答题',
        "imgUrl" : 'lib/images/home/sy_zxdt.png',
      },
      {
        "title" : '出停珍',
        "imgUrl" : 'lib/images/home/sy_ctz.png',
      },
      {
        "title" : '我的文章',
        "imgUrl" : 'lib/images/home/sy_wdwz.png',
      },
      {
        "title" : '群发消息',
        "imgUrl" : 'lib/images/home/sy_qfxx.png',
      },
      {
        "title" : '发布公告',
        "imgUrl" : 'lib/images/home/sy_ggsz.png',
      },
      {
        "title" : '服务设置',
        "imgUrl" : 'lib/images/home/sy_fwsz.png',
      },
      {
        "title" : '联系医助',
        "imgUrl" : 'lib/images/home/sy_lxyz.png',
      },
      {
        "title" : '',
        "imgUrl" : 'lib/images/home/sy_gd.png',
      },
      {
        "title" : '',
        "imgUrl" : '',
      },
    ];

    var tempList = listData.asMap().keys.map((index){
//      return GridItem(listData[index]['title'], listData[index]['imgUrl'],onTap: ()=>{LogUtil.e("aaaa")},);
      return FlatButton(
        child: GridItem(listData[index]['title'], listData[index]['imgUrl'],),
        onPressed: () {_onItem(index);},
        color: Colors.white,
        highlightColor: index == listData.length-1?Colors.white:Colors.black12
      );
    });
    return tempList.toList();
  }



  void _onItem(int position) {
    LogUtil.e("111 + $position");
    switch(position) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        break;
      case 5:
        break;
      case 6:
        break;
      case 7:
        break;
      default:

        break;
    }
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
      child: Stack(
        alignment : AlignmentDirectional.topEnd,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage(imgUrl),
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
          Container(
            padding: EdgeInsets.fromLTRB(2, 3, 2, 3),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(8))
            ),
            margin: EdgeInsets.only(top: 22,right: 20),
            child: Text('未开通',style: TextStyle(color: Colors.white,fontSize: 12, ),),
          )
        ],
      ),
    );
  }
}


class GridItem extends StatefulWidget {
  final String title;
  final String imgUrl;
  const GridItem(this.title, this.imgUrl,
      {
        Key key,
      }) : super(key: key);

  @override
  _GridItemState createState() => _GridItemState(title,imgUrl,);
}

class _GridItemState extends State<GridItem> {
  final String title;
  final String imgUrl;

  _GridItemState(this.title, this.imgUrl,);

  @override
  Widget build(BuildContext context) {
    return imgUrl==''?SizedBox(height: 2,):Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(imgUrl,height: 40,),
        SizedBox(height: 8,),
        title == ''?SizedBox(height: 0,):Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16
          ),
        ),
      ],
    );

  }
}
