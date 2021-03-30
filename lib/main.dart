import 'dart:async';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'common.dart';
import 'data.dart';
import 'gameOver.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    return new MaterialApp(
      title: '游戏开始',
      theme: new ThemeData(
        primaryColor: Colors.redAccent,
      ),
      home: Content(),
    );
  }
}

class Content extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Content();
  }
}

class _Content extends State<Content> {
  String _newValue;
  var _count = 0;
  var _score = 100;
  // var _everyItem =  _score / list.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('问题${_count+1}'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              child:Text(list[_count]['question'],style: TextStyle(
                fontSize: 30,
                color: Colors.greenAccent
              )),
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
            ),
            Column(
              children: <Widget>[
                RadioListTile<String>(
                  value: list[_count]["answerA"],
                  title: Text(list[_count]["answerA"],style: TextStyle(
                    fontSize: 25,
                    color: Colors.blueAccent
                  )),
                  groupValue: _newValue,
                  onChanged: (value) {
                    changeItem(value);
                  },
                ),
                RadioListTile<String>(
                  value: list[_count]["answerB"],
                  title: Text(list[_count]["answerB"],style: TextStyle(
                    fontSize: 25,
                    color: Colors.blueAccent
                  )),
                  groupValue: _newValue,
                  onChanged: (value) {
                    changeItem(value);
                  },
                ),
                RadioListTile<String>(
                  value: list[_count]["answerC"],
                  title: Text(list[_count]["answerC"],style: TextStyle(
                    fontSize: 25,
                    color: Colors.blueAccent
                  )),
                  groupValue: _newValue,
                  onChanged: (value){
                    changeItem(value);
                  },
                ),
              ],
            ),
          ],
        ),
      )
    );
  }

  changeItem(String value) {
    setState(() {
      _newValue = value;
      if(_count < list.length){
        if(list[_count]["rightAnswer"] == _newValue){
          showCorrectToast("回答正确");
          const timeout = const Duration(seconds: 2);
          Timer(timeout, (){
            setState(() {
              _count=_count + 1;
            });
            if(_count == list.length){
                Navigator.of(context).push(new MaterialPageRoute(builder: (_)=>GameOver()),).then((val)=>val?reload():null);
                setState(() {
                _count=_count - 1;
              });
            }
          });
        }else{
          showErrorToast("回答错误");
        }
      }
    });
  }

  reload(){
    setState(() {
      _count = 0;
    });
  }
}