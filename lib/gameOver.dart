import 'package:flutter/material.dart';
import 'common.dart';

class GameOver extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GameOver();
  }
}

class _GameOver extends State<GameOver> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('游戏结束'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
              Image.asset('assets/images/gameover.png',width: 100,height: 100,),
              Container(
                child:Text('游戏结束',style: TextStyle(
                  fontSize: 40,
                  color: Colors.green
                  ),
                ),
                margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 50.0),
              ),
              RaisedButton(
                onPressed: (){
                  Navigator.pop(context,true);
                },
                child: Text("重新开始游戏",style: TextStyle(
                  fontSize: 20
                ),),
                color: Colors.greenAccent,
                textColor: Colors.blue,
              )
           ],
        )
      )
    );
  }
}