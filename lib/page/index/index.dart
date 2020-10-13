import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    List _tabList = ["最热", "娱乐","科技","商业","历史","其他",];

    _buildTabItem(title){
      return Container(
        height: 40.0,
        alignment: Alignment.center,
        child: Text('$title',style: TextStyle(color: Colors.white,fontSize: 14.0),),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: _tabList.length,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                for(int i =0;i<_tabList.length;i++)...[
                  _buildTabItem(_tabList[i])
                ]
              ],
            ),
            title: Text("首页"),
            backgroundColor: Colors.blue,
          ),
          body: TabBarView(
            children: [
              for(int i =0;i<_tabList.length;i++)...[
                Center(
                  child: Text('${_tabList[i]}',style: TextStyle(fontSize: 22.0),),
                )
              ]
            ],
          ),
        ),
      )
    );
  }
}
