import 'package:flutter/material.dart';

class Statbar extends StatelessWidget {
  final Map json;
  const Statbar({super.key, required this.json});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stat(statName: "int", json: json),
        Stat(statName: "con", json: json),
        Stat(statName: "dex", json: json),
        Stat(statName: "wis", json: json),
        Stat(statName: "cha", json: json),
        Stat(statName: "str", json: json)
      ],
    );
  }
}

class Stat extends StatelessWidget {
  final String statName;
  final Map json;
  const Stat({super.key, required this.statName, required this.json});
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(statName + ': '),
        Text(json["stats"][statName].toString())
      ],
    );
  }
}