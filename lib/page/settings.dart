import 'package:flutter/material.dart';
import 'package:flutter_ask_answer_game/common/global.dart';

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
            SwitchListTile(
              value: isChangeQuizOrder,
              title: Text('是否更换题目顺序'),
              onChanged: (value){
                setState(() {
                  isChangeQuizOrder = value;
                  Global.isChangeQuizOrder = value;
                });
              }
            ),
            SwitchListTile(
              value: isChangeOptionOrder, 
              title: Text('是否更换选项顺序'),
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