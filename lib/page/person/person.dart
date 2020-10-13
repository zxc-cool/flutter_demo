import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/page/routes.dart';

class Person extends StatefulWidget {
  @override
  _PersonState createState() => _PersonState();
}

class _PersonState extends State<Person> {

  int _collectionCount = 0;
  int _browseCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            _buildAuthor(context),
            SizedBox(
              height: 10,
            ),
            _buildCollectionAndRecord(context),
            SizedBox(
              height: 10,
            ),
            _buildItem('关于', () {
              Routes.toAboutPage(context);
            }),
          ],
        ),
      ),
    );
  }

  ///
  /// 作者简介
  ///
  _buildAuthor(BuildContext context) {
    return InkWell(
      onTap: () {
      },
      child: Container(
        height: 100,
        color: Colors.white,
        padding: EdgeInsets.only(left: 25, right: 15),
        child: Container(
          child: Row(
            children: <Widget>[
              //头像
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/header.png'),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(60))),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'XX程序员',
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '一枚有态度的程序员',
                      style: TextStyle(color: Color(0xFF727272)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFFC9C9C9)),
            ],
          ),
        ),
      ),
    );
  }

  ///
  /// 收藏和浏览记录
  ///
  _buildCollectionAndRecord(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _buildItem('我收藏的文章($_collectionCount)', () {
          }),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: Divider(
              height: 1,
            ),
          ),
          _buildItem('我浏览的文章($_browseCount)', () {
            // Navigator.pushNamed(context, Routes.browse_page);
          }),
        ],
      ),
    );
  }

  _buildItem(String title, onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 65,
        color: Colors.white,
        padding: EdgeInsets.only(left: 25, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFFC9C9C9)),
          ],
        ),
      ),
    );
  }
}
