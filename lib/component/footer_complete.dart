import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FooterComplete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClassicFooter(
      noDataText: '没有更多数据啦~',
      idleText: '加载更多',
      loadingText: '加载中...',
    );
  }
}
