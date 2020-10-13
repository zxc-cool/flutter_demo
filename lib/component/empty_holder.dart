import 'package:flutter/material.dart';

class EmptyHolder extends StatelessWidget {
  final EdgeInsets padding;
  EmptyHolder({this.padding = const EdgeInsets.only(top: 50.0, bottom: 50.0)});

  @override
  build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: padding,
      child: Column(
        children: <Widget>[
          Image.asset('assets/images/empty.png', width: 158.0,),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Text('暂无信息', style: TextStyle(
              color: Color(0xFF8F929B),
              fontSize: 14.0
            )),
          )
        ],
      )
    );
  }
}