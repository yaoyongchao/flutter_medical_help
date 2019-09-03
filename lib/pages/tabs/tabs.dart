import 'package:flutter/material.dart';
import '../home/home.dart';
import '../finance/my_finance.dart';
import '../tabs/my_drawer.dart';
import '../mine/mine.dart';
import 'dart:ui';
/**
 * Author: YongChao
 * Date: 19-9-2 上午11:22
 * Description: Tabs
 */

class Tabs extends StatefulWidget {
  final index;
  Tabs({Key key,this.index = 0}): super(key:key);

  @override
  _TabsState createState() => _TabsState(this.index);
}

class _TabsState extends State<Tabs> {

  int _currentIndex = 0;
  var _pageController = new PageController(initialPage: 0);

  _TabsState(index) {
    this._currentIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        width: 280,
        child: Drawer(//添加策划菜单Widget
            child: MyDrawer()
        ),
      ),
        body: new PageView.builder(
            onPageChanged: _pageChange,
            controller: _pageController,
            itemCount: 3,
            physics: new NeverScrollableScrollPhysics(),//禁止滑动
            itemBuilder: (BuildContext context,int index) {
              switch (index) {
                case 0:
                  return Home();
                case 1:
                  return MyFinance();
                case 2:
                  return Mine();
              }
            }
        ),
        bottomNavigationBar: new BottomNavigationBar(items: [
            BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('首页')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('我的财务'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('我')
          )
        ],
          currentIndex: _currentIndex,
          onTap: onTap,
        ),
    );
  }

  //bottomnaviagtionbar 和 pageView的联动
  void onTap(int index) {
    //过pageView的pagecontroler 的 animateTopPage方法可以跳转
    _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease
    );
  }

  void _pageChange(int index) {
    setState(() {
      if (_currentIndex != index)
        _currentIndex = index;
    });
  }

  Widget _buildUserAccountDrawerHeader() {
    return new UserAccountsDrawerHeader(//系统提供的一种DrawerHeader layout样式
      accountName: Text("Thai"),//用户名
      accountEmail: Text("Thai@gmail.com"),//用户邮箱
      currentAccountPicture: Image.network( //头像
        "https://b-ssl.duitang.com/uploads/item/201602/15/20160215235057_EU3tS.thumb.700_0.jpeg",
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildDrawerBody() {
    return new Column(//列控件
      children: <Widget>[
        ListTile(
          title: Text("Ttem 1"),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, "drawerPage1");
          },
        ),
        ListTile(
          title: Text("Item 2"),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            //关闭drawer
            Navigator.of(context).pop();
            //跳转到新页面，将当前页面加入回退栈
            Navigator.pushNamed(context, "drawerPage2");
          },
        ),
      ],
    );
  }

  Widget buildDrawer(BuildContext context) {
    return new ListView(
      children: <Widget>[
        _buildUserAccountDrawerHeader(),
        _buildDrawerBody(),
      ],
    );
  }

}
