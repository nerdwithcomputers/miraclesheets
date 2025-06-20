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
          child: const Column(
            children: [
              Text('Intelligence'),
              Text('Constitution'),
              Text('Dexterity'),
              Text('Wisdom'),
              Text('Charisma'),
              Text('Strength')
            ],
          ),
        ),
        Column(
          children: [
            Modifier(character: character, statName: "int"),
            Modifier(character: character, statName: "con"),
            Modifier(character: character, statName: "dex"),
            Modifier(character: character, statName: "wis"),
            Modifier(character: character, statName: "cha"),
            Modifier(character: character, statName: "str")
          ]
        ),
        Column(
          children: [
            Stat(statName: "int", character: character),
            Stat(statName: "con", character: character),
            Stat(statName: "dex", character: character),
            Stat(statName: "wis", character: character),
            Stat(statName: "cha", character: character),
            Stat(statName: "str", character: character),
          ],
        ),
      ]
    );
  }
}

class Modifier extends StatelessWidget {
  final Map character;
  final String statName;
  const Modifier({super.key, required this.character, required this.statName});

  @override
  Widget build(BuildContext context) {
    var mod = ((character["stats"][statName]-10)/2).toInt();
    var modifier = mod >= 0 ? "+$mod" : "$mod";
    return Container(
      child: Text(modifier),
    );
  }
}

class Stat extends StatelessWidget {
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