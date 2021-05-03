import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'common.dart';

class GameOver extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GameOver();
  }
}

class _GameOver extends State<GameOver> {
  double _score;
  String _seconds;
  var execute = true;

  @override
  Widget build(BuildContext context) {
    if(execute){
      getScoreAndTime();
      execute = false;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('游戏结束'),
      ),
      body: Center(
        child: ListView(
          children:[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child:Image.asset('assets/images/gameover.png',width: 100,height: 100,),
                    margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0)
                  ),
                  Container(
                    child:Text('游戏结束',style: TextStyle(
                      fontSize: 30,
                      color: Colors.green
                      ),
                    ),
                    margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0)
                  ),
                  Container(
                    child:Text('您的分数为：$_score',style: TextStyle(
                      fontSize: 30,
                      color: Colors.green
                      ),
                    ),
                    margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0)
                  ),
                  Container(
                    child:Text('所花时间为：${_seconds}s',style: TextStyle(
                      fontSize: 30,
                      color: Colors.green
                      ),
                    ),
                    margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 50.0)
                  ),
                  RaisedButton(
                    onPressed: (){
                      Navigator.pop(context,true);
                    },
                    textColor: Colors.white,
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(22.0))),
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
                          child: Text('重新开始游戏')),
                      ),
                  )
                ],
            )
          ]
        )
      )
    );
  }

  getScoreAndTime() async{
    final prefs = await SharedPreferences.getInstance();
    final score = prefs.getDouble('score') ?? 0;
    final startTimeStr = prefs.getString('time') ?? 0;
    var startTime = DateTime.parse(startTimeStr);
    var endTime = DateTime.now();
    var seconds = endTime.difference(startTime).inSeconds.toString();
    setState(() {
      _score = score;
      _seconds = seconds;
    });
  }
}