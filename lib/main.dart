import 'package:flutter_ask_answer_game/page/bottom_tab_bar.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    return new MaterialApp(
      title: '竞赛开始',
      theme: new ThemeData(
        primaryColor: Colors.redAccent,
      ),
      home: BottomTabBar(),
    );
  }
}