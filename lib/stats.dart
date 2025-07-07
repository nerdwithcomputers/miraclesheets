import 'package:flutter/material.dart';

class Statbar extends StatelessWidget {
  final Map character;
  const Statbar({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              for(var stat in character["stats"].keys)
                Text(stat)
            ],
          ),
        ),
        Column(
          children: [
            for(var stat in character["stats"].values) 
              Modifier(character: character, statName: stat)
          ]
        ),
        Column(
          children: [
            for(var stat in character["stats"].keys)
              Stat(character: character, statName: stat)
          ],
        ),
      ]
    );
  }
}

class Modifier extends StatelessWidget {
  final Map character;
  final int statName;
  const Modifier({super.key, required this.character, required this.statName});

  @override
  Widget build(BuildContext context) {
    // rounding actually sucks
    var diff = statName - 10;
    var sign = diff<0 ? "-" : "+";
    if(((diff%2) != 0) && (sign=="-")){
      diff -= 1;
    }
    var mod = diff.abs() ~/ 2;
    var modifier = "$sign$mod";
    return Container(
      child: Text(modifier),
    );
  }
}

class Stat extends StatelessWidget {
  // name of stat
  final String statName;
  // final String name;
  final Map character;
  const Stat({super.key, required this.statName, required this.character});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(character["stats"][statName].toString())
    );
  }
}