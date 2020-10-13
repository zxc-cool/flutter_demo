import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/component/empty_holder.dart';
import 'package:flutter_demo/component/footer_complete.dart';
import 'package:flutter_demo/component/header_complete.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Business extends StatefulWidget {
  @override
  _BusinessState createState() => _BusinessState();
}

class _BusinessState extends State<Business> {
  RefreshController _refreshController = RefreshController();   //上拉加载和拖动刷新控制器

  var _words = <String>[];
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loading = true;
    _retrieveData();
    print(_words.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商城"),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if(loading)
              Container(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                //加载时显示loading
                child: SpinKitCircle(
                  color:  Color(0xFF8F929B),
                ),
              )
            else
              Expanded(
                child: SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: true,
                  header: WaterDropHeader(
                    complete: HeaderComplete(),
                  ),
                  footer: FooterComplete(),
                  controller: _refreshController,
                  onRefresh: _onRefresh,
                  onLoading: _onLoading,
                  child: _words.isEmpty
                      ? Container(
                      child: EmptyHolder()
                  )
                      : ListView.builder(
                      itemCount: _words?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(title: Text(_words[index]));
                      }
                  ),
                ),
              ),
          ],
        ),
      )
    );
  }

  //刷新
  _onRefresh(){
    //延迟执行
    Future.delayed(Duration(milliseconds: 300)).then((e) {
      setState(() {
        _refreshController.refreshCompleted();
        //重新构建列表
        _words = generateWordPairs().take(20).map((e) => e.asPascalCase).toList();
      });
    });
  }
  //加载更多
  _onLoading(){
    _retrieveData();
  }

  void _retrieveData() {
    //延迟执行
    Future.delayed(Duration(milliseconds: 300)).then((e) {
      setState(() {
        _refreshController.loadComplete();
        //重新构建列表
        _words.addAll(
            //每次生成20个单词  english_words 插件方法
            generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
        );
        loading = false;
      });
    });
  }
}
