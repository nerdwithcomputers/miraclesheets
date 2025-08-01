import 'package:flutter/material.dart';
import 'dart:math';
import 'package:miraclesheets/main.dart';
import 'package:miraclesheets/extensions.dart';

class Roll extends StatelessWidget{
  final Map character;
  final String? statName;
  final int? statMod;
  final int sides;
  final String? text;
  final int? times;
  const Roll({
    super.key,
    required this.character,
    required this.sides,
    this.statMod,
    this.statName,
    this.text,
    this.times
  });
  
  @override
  Widget build(BuildContext context) {
    int add = statMod ?? (character["stats"][statName] as int).parseModInt();
    var stringAdd = add>0 ? "+$add":"$add";
    return InkWell(
      child: Text(text??"${times??1}d$sides $stringAdd  "),
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
        Navigator.push(context, MaterialPageRoute(
          builder: (BuildContext context){
            return Container(
              decoration: const BoxDecoration(),
              child: Column(
                children: [
                  Text(retResults),
                  ElevatedButton(onPressed: ()=>Navigator.pop(context), child: const Text("dismiss"))
                ],
              )
            );
          }
        ));
      },
    );
  }
}