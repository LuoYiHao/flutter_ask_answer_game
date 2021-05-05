import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_ask_answer_game/common/common.dart';
import 'quiz_over.dart';
import 'package:flutter_ask_answer_game/common/option.dart';
import 'package:flutter_ask_answer_game/common/data.dart';
import 'package:flutter_ask_answer_game/common/global.dart';

class AskAnswerQuiz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AskAnswerQuiz();
  }
}

class _AskAnswerQuiz extends State<AskAnswerQuiz> {
  String _radioVal;
  var _count = 0;
  static double _score = 100;
  String _time = DateTime.now().toString();
  List<Option> _checkboxOptions = List();
  List<String> selName = List();
  List list = List();

  var _tmpCount = -1;
  var radioShuffleOptions = [];
  List checkboxShuffleOptions = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('问题${_count+1}'),
      ),
      body: Container(
        child:ListView(
        children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              child:Text(list[_count]['question'],style: TextStyle(
                fontSize: 20,
                color: Colors.black
              )),
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
            ),
            Column(
              children:generateOptions()
            ),
          ],
        )]),
      )
    );
  }

  reload(){
    setState(() {
      _count = 0;
      _score = 100;
      _time = DateTime.now().toString();
    });
  }

  saveScoreAndStartTime(){
    saveSharedPreferences('score', _score, 'double');
    saveSharedPreferences('time', _time, 'String');
  }

  handleAnswerRight(){
    showCorrectToast("回答正确");
    const timeout = const Duration(seconds: 2);
    Timer(timeout, (){
      setState(() {
        _count = _count + 1;
        _radioVal = '';
      });
      
      if(_count == list.length || (Global.dropdownValue != 'all' && _count == double.parse(Global.dropdownValue))){
        saveScoreAndStartTime();
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>QuizOver())).then((val)=>val?reload():null);
        setState(() {
          _count = _count - 1;
        });
      }
      retsetCheckboxOptions();
    });
  }

  handleAnswerWrong(){
    showErrorToast("回答错误");
    if(_score > 0){
      var _everyItem =  _score / list.length;
      setState(() {
        _score = _score - _everyItem;
      });
    }
  }

  changeItem(String value) {
    setState(() {
      _radioVal = value;
      if(_count < list.length){
        if(list[_count]["rightAnswer"] == value){
          handleAnswerRight();
        }else{
          handleAnswerWrong();
        }
      }
    });
  }

  @override
  void initState(){
    list = Global.isChangeQuizOrder?shuffle(arr):arr;
    retsetCheckboxOptions();
  }

  retsetCheckboxOptions(){
    var problem = list[_count];
    if(problem['type']=='checkbox'){
      setState(() {
        _checkboxOptions = List();
        for(var item in problem['options']){
          Option option = Option();
          option.title = item['title'];
          option.isRight = item['isRight'];
          _checkboxOptions.add(option);
        }
      });
    }
  }
  
  bool confirmAnswer(){
    for(var item in _checkboxOptions){
      if(item.isRight&&item.isSelected){
        continue;
      }else if(!item.isRight&&!item.isSelected){
        continue;
      }else{
        return false;
      }
    }
    return true;
  }

  List<Widget> generateOptions(){
    List<Widget> _optionList = [];
    var problem = list[_count];
    var _radioOptions = [];

    if(problem['type']=='radio'){
      _radioOptions = problem['options'].split(",");
    }

    Widget tile;
    if(problem['type']=='radio'){
      //打乱选项
      if(Global.isChangeOptionOrder){
        if(_tmpCount != _count){
          _tmpCount = _count;
          radioShuffleOptions = shuffle(_radioOptions);
        }
      _radioOptions = radioShuffleOptions;
      }
      for(var option in _radioOptions){
        tile = RadioListTile<String>(
          value: option,
          title: Text(option,style: TextStyle(
            fontSize: 20,
            color: Colors.black
          )),
          groupValue: _radioVal,
          onChanged: (value) {
            changeItem(value);
          },
        );
        _optionList.add(tile);
      }
    }else if(problem['type']=='checkbox'){
      if(Global.isChangeOptionOrder && _tmpCount != _count){
        _tmpCount = _count;
        checkboxShuffleOptions = shuffle(_checkboxOptions);
        _checkboxOptions = List();
        for(var option in checkboxShuffleOptions){
          _checkboxOptions.add(option);
        }
      }
      for(var option in _checkboxOptions){
        tile = CheckboxListTile(
          title: Text(option.title),
          value: option.isSelected, 
          onChanged: (value) {
            setState(() {
              option.isSelected = value;
              if(option.isSelected){
                if(!selName.contains(option.title))
                  selName.add(option.title);
              }
              else{
                if(selName!=null && selName.contains(option.title))
                  selName.remove(option.title);
              }
            });
          },
        );
        _optionList.add(tile);
      }
    }

    if(problem['type']=='checkbox'){
      var btn = Container(
        margin: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
        child: RaisedButton(
          onPressed: (){
            if(confirmAnswer()){
              handleAnswerRight();
            }else{
              handleAnswerWrong();
            }
          },
          textColor: Colors.white,
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(22.0))
          ),
          padding: const EdgeInsets.all(0.0),
          child: Container(
            width: 260,
            height: 44,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xff6FB2FF),
                  Color(0xff095FFF),
                ],
              ),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Container(
              alignment: Alignment.center,
              child: Text('提交')),
          ),
        )
      );
      _optionList.add(btn);
    }
    return _optionList;
  }
}