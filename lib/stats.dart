import 'package:flutter/material.dart';

class Statbar extends StatelessWidget {
  final Map json;
  const Statbar({super.key, required this.json});

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
            Modifier(json: json, statName: "int"),
            Modifier(json: json, statName: "con"),
            Modifier(json: json, statName: "dex"),
            Modifier(json: json, statName: "wis"),
            Modifier(json: json, statName: "cha"),
            Modifier(json: json, statName: "str")
          ]
        ),
        Column(
          children: [
            Stat(statName: "int", json: json),
            Stat(statName: "con", json: json),
            Stat(statName: "dex", json: json),
            Stat(statName: "wis", json: json),
            Stat(statName: "cha", json: json),
            Stat(statName: "str", json: json),
          ],
        ),
      ]
    );
  }
}

class Modifier extends StatelessWidget {
  final Map json;
  final String statName;
  const Modifier({super.key, required this.json, required this.statName});

  @override
  Widget build(BuildContext context) {
    var mod = ((json["stats"][statName]-10)/2).toInt();
    var modifier = mod >= 0 ? "+$mod" : "$mod";
    return Container(
      child: Text(modifier),
    );
  }
}

class Stat extends StatelessWidget {
  final String statName;
  // final String name;
  final Map json;
  const Stat({super.key, required this.statName, required this.json});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(json["stats"][statName].toString())
    );
  }
}