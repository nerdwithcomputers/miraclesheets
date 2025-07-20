import 'package:flutter/material.dart';
import 'package:miraclesheets/dice.dart';
import 'package:miraclesheets/extensions.dart';

class Statbar extends StatelessWidget {
  final Map character;
  const Statbar({
    super.key,
    required this.character
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              for(String stat in character["stats"].keys)
                Text(stat)
            ],
          ),
        ),
        Column(
          children: [
            for(int stat in character["stats"].values)
              Roll(
                character: character,
                sides: 20,
                statMod: stat.parseModInt(),
                text: stat.parseModString()
              )
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