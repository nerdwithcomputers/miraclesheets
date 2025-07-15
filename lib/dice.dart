import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math';

import 'package:miraclesheets/main.dart';
class Roll extends StatelessWidget{
  final Map character;
  final String stat;
  final int sides;
  final int? times;
  const Roll({
    super.key,
    required this.character,
    required this.sides,
    required this.stat,
    this.times
  });
  @override
  Widget build(BuildContext context) {
    int add;
    if(stat[0]=="+" || stat[0]=="-"){
      add = int.parse(stat);
    }else{
      add = character["stats"][stat];
    }
    var stringAdd = add>0 ? "+$add":"$add";
    return InkWell(
      child: Text("${times??1}d$sides $stringAdd"),
      onTap: () {
        List<int> results = [];
        for(var i=times??1; i>0; i--){
          Random random = Random();
          int roll = random.nextInt(sides)+1+add;
          results.add(roll);
        }
        String retResults = "";
        for(var result in results){
          retResults += retResults.isEmpty ? "$result" : ", $result";
        }
        if(results.length>1){
          retResults += "\n MAX: ${results.reduce(max)} MIN: ${results.reduce(min)}";
        }
        chatList.add(Text(retResults));
      },
    );
  }
}