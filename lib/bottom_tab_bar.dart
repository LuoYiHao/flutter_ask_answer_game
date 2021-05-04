import 'package:flutter/material.dart';
import 'start_quiz.dart';

class BottomTabBar extends StatefulWidget {
  @override
  _BottomTabBarState createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar>{
  int _currentIndex = 0;
  List<Widget> list = List();
  final _bottomNavBarColor = Colors.blue;

  @override
  void initState(){
    list..add(StartQuiz())
    ..add(StartQuiz())
    ..add(StartQuiz())
    ..add(StartQuiz());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.games,
              color: _bottomNavBarColor,
            ),
            title: Text('竞赛',style: TextStyle(color: _bottomNavBarColor))
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: _bottomNavBarColor,
            ),
            title: Text('设置',style: TextStyle(color: _bottomNavBarColor))
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (int index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}