import 'package:flutter/material.dart';
import 'package:flutter_demo/page/person/about/about.dart';

import 'home/home.dart';
class Routes {
  // 替换
  static pushReplacementNamed(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }
  // 跳转
  static pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  // tab pages
  static toHome(BuildContext context, {initialPage}) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Home(initialPage: initialPage)));
  }
  // 跳转关于页面
  static toAboutPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AboutPage()));
  }
}
