import 'package:flutter/material.dart';
import 'package:flutter_ask_answer_game/global.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isChangeQuizOrder = Global.isChangeQuizOrder;
  bool isChangeOptionOrder = Global.isChangeOptionOrder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(30, 50, 0, 0),
        child: Column(
          children: [
            Text('是否更换题目顺序'),
            Switch(
              value: isChangeQuizOrder, 
              onChanged: (value){
                setState(() {
                  isChangeQuizOrder = value;
                  Global.isChangeQuizOrder = value;
                });
              }
            ),
            Text('是否更换选项顺序'),
            Switch(
              value: isChangeOptionOrder, 
              onChanged: (value){
                setState(() {
                  isChangeOptionOrder = value;
                  Global.isChangeOptionOrder = value;
                });
              }
            ),
          ],
        ),
      )
    );
  }
}