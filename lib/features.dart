import 'package:flutter/material.dart';

class Descriptions extends StatelessWidget{
  final Map character;
  // final String text;
  // final String desc;
  const Descriptions({
    super.key,
    required this.character,
    // required this.text,
    // required this.desc
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          ...character["features"].keys.toList().map((name)=>
            ListTile(
              title: Text("$name -"),
              subtitle: Text(character["features"][name]),
              style: ListTileStyle.drawer,
            )
          )
        ],
      )
    );
  }
}

