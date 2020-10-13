import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/page/business/business.dart';
import 'package:flutter_demo/page/index/index.dart';
import 'package:flutter_demo/page/person/person.dart';

class Home extends StatefulWidget {
  final initialPage;

  Home({this.initialPage});
  @override
  _Home createState() => _Home(initialPage:initialPage);
}

class _Home extends State<Home>  with TickerProviderStateMixin{
  int initialPage = 0;
  _Home({this.initialPage});

  void _onItemTapped(int index) {
    setState(() {
      initialPage = index;
    });
  }

  // 底部导航栏各个可切换页面组
  List<Widget> _bottomNavPages = [
    IndexPage(),
    Business(),
    Person(),
  ];


  void initState() {
    super.initState();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: _bottomNavPages[initialPage],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('商城')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我的')),
        ],
        currentIndex: initialPage,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
