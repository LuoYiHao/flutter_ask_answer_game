import 'package:flutter/material.dart';
import 'ask_answer_quiz.dart';

class StartQuiz extends StatefulWidget {
  @override
  _StartQuizState createState() => _StartQuizState();
}

class _StartQuizState extends State<StartQuiz> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
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
                Color(0xff25D1D1),
                Color(0xff3BE6AD),
                Color(0xff20DDAA)
              ],
            ),
          ),
          padding: const EdgeInsets.all(10.0),
          child: Container(
            alignment: Alignment.center,
            child: Text('开始竞赛')),
        )
      )
    );
  }
}