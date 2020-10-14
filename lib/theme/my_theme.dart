import 'package:flutter/material.dart';

class MyTheme {
  static get theme {
    return ThemeData.light().copyWith(
      platform: TargetPlatform.iOS,
      primaryColor: MyColors.blue,
      scaffoldBackgroundColor: MyColors.scaffoldBgColor,
      brightness: Brightness.light,
    );
  }
}

class MyColors {
  static const Color blue = Color(0xFF49B78C);

  static const Color white = Color(0xFFFFFFFF);

  static const Color darkDarken = Color(0xFF25272D);
  static const Color dark = Color(0xFF30343F);

  static const Color grey = Color(0xFFF8F8FA);

  static const Color bgColor = white;
  static const Color scaffoldBgColor = grey;

}

class WakaStyle {
  // 页面标题
  static const pageTitleStyle = TextStyle(fontSize: 17.0, color: MyColors.darkDarken, fontWeight: FontWeight.w700);

}
