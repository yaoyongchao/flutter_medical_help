import 'package:flutter/cupertino.dart';

/**
 * Author: YongChao
 * Date: 19-9-4 上午10:19
 * Description: Home页，网格布局
 */

class HomeGridView extends StatefulWidget {
  @override
  _HomeGridViewState createState() => _HomeGridViewState();
}

class _HomeGridViewState extends State<HomeGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      children: this._getItem(),
    );
  }

  List<Widget> _getItem() {
    List listData = [
      {
        "title" : '自选答题',
        "imgUrl" : 'images/home/sy_ctz.png',
      },
      {
        "title" : '自选答题',
        "imgUrl" : 'images/home/sy_ctz.png',
      },
      {
        "title" : '自选答题',
        "imgUrl" : 'images/home/sy_ctz.png',
      },
      {
        "title" : '自选答题',
        "imgUrl" : 'images/home/sy_ctz.png',
      },
      {
        "title" : '自选答题',
        "imgUrl" : 'images/home/sy_ctz.png',
      },
      {
        "title" : '自选答题',
        "imgUrl" : 'images/home/sy_ctz.png',
      },
    ];

    var tempList = listData.map((value){
      return Container(
        child: Column(
          children: <Widget>[
            Image.asset(value['imgUrl']),
            SizedBox(height: 12,),
            Text(
                value['title'],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20
              ),
            ),
          ],
        ),
      );
    });
    return tempList.toList();
  }
}



class HomeGridData {

}
