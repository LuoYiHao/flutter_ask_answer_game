import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

showErrorToast(String msg){
  Fluttertoast.showToast(
    msg:msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIos: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0
  );
}

showCorrectToast(String msg){
  Fluttertoast.showToast(
    msg:msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIos: 1,
    backgroundColor: Colors.green,
    textColor: Colors.white,
    fontSize: 16.0
  );
}

//获取min和max之间的一个随机整数[5,100];
int getRandomInt(var min,var max){
  final _random = new Random();
	return _random.nextInt((max - min).floor()) + min;
}

//打乱数组
shuffle(List arr){
  List newArr = List();
  newArr.addAll(arr);
	for (var i = 1; i < newArr.length; i++){
		var j = getRandomInt(0,i);
		var t = newArr[i];
		newArr[i] = newArr[j];
		newArr[j] = t;
	}
	return newArr;
}

getSharedPreferences(key,type) async{
  final prefs = await SharedPreferences.getInstance();
  switch(type){
    case 'bool':
      return prefs.getBool(key) ?? true;
  }
}

saveSharedPreferences(key,val,type) async{
  final prefs = await SharedPreferences.getInstance();
  switch(type){
    case 'bool':
      prefs.setBool(key, val);
      break;
  }
}