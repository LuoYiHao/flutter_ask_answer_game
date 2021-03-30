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
      )
    );
  }
}