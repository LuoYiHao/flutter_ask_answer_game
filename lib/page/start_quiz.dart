import 'package:flutter/material.dart';
import 'ask_answer_quiz.dart';
import 'dart:ui';
import 'package:flutter_ask_answer_game/common/common.dart';
import 'package:flutter_ask_answer_game/common/global.dart';

class StartQuiz extends StatefulWidget {
  @override
  _StartQuizState createState() => _StartQuizState();
}

class _StartQuizState extends State<StartQuiz> {
  List list;
  @override
  void initState() {
    getSharedPreferences("isChangeQuizOrder","bool").then((isChangeQuizOrder){
      Global.isChangeQuizOrder = isChangeQuizOrder;
    });
    getSharedPreferences("isChangeOptionOrder","bool").then((isChangeOptionOrder){
      Global.isChangeOptionOrder = isChangeOptionOrder;
    });
    getSharedPreferences("dropdownValue","String").then((dropdownValue){
      Global.dropdownValue = dropdownValue;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Image.network('https://z3.ax1x.com/2021/05/05/gMWDC8.jpg'
            ,fit: BoxFit.cover),
          ),
          Center(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3.0,sigmaY: 3.0),
                child: Opacity(
                  opacity: 0.7,
                  child: Container(
                    width: 500.0,
                    height: 800.0,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200
                    ),
                    child: Center(
                      child:RaisedButton(
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AskAnswerQuiz()));
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
                            child: Text('开始竞赛')),
                        )
                      )
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}