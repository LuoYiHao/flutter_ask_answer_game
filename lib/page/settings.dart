import 'package:flutter/material.dart';
import 'package:flutter_ask_answer_game/common/common.dart';
import 'package:flutter_ask_answer_game/common/global.dart';
import 'package:flutter_ask_answer_game/common/data.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isChangeQuizOrder = Global.isChangeQuizOrder;
  bool isChangeOptionOrder = Global.isChangeOptionOrder;
  String dropdownValue = Global.dropdownValue;

  @override
  Widget build(BuildContext context) {
    List dropDownArr = [];
    for(var i = 1;i <= arr.length;i++){
      dropDownArr.add(i.toString());
    }
    dropDownArr.add("全部");
    
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
                  saveSharedPreferences('isChangeQuizOrder', value, "bool");
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
                  saveSharedPreferences('isChangeOptionOrder', value, "bool");
                });
              }
            ),
            ListTile(
              title: Text('选择题目数'),
              trailing: DropdownButton(
                value: dropdownValue,
                onChanged: (String value) {
                  setState(() {
                    value = value == "all"?"all":value;
                    dropdownValue = value;
                    saveSharedPreferences("dropdownValue", value, "String");
                  });
                },
                items: dropDownArr.map<DropdownMenuItem<String>>((value) {
                  return DropdownMenuItem(
                    value: value == "全部"?"all":value,
                    child: Text(value),
                  );
                }).toList(),
              )
            )
          ],
        ),
      )
    );
  }
}