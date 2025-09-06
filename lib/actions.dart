import 'package:flutter/material.dart';
import 'package:miraclesheets/dice.dart';
import 'package:miraclesheets/extensions.dart';
import 'package:miraclesheets/subactions.dart';

Widget ActionBar(Map character){
  return Expanded(
      child: ListView(
        children: [
          ...character["actions"].entries.toList().map(
            (MapEntry entry)=> Action(
              character: character,
              name: entry.key,
              dice: entry.value["dice"],
              description: entry.value["description"],
            )
          )
        ],
      )
    );
}

class Action extends StatefulWidget {
  final Map character;
  final String name;
  final List dice;
  final String? description;
  const Action({
    super.key,
    required this.character,
    required this.name,
    required this.dice,
    this.description
  });
  @override
  State<Action> createState() => ActionState();
}


class ActionState extends State<Action>{
  bool state = true;
  @override
  Widget build(BuildContext context) {
    // font size of names of actions
    double headerFontSize = 25;
    return Column(
      children: [
        Row(
          children: [
            Text("${widget.name}  ", style: TextStyle(
              fontSize: headerFontSize,
              fontWeight: FontWeight.w600
            )),
            const Spacer(),
            InkWell(
              child: Text(state?"V":"Ʌ", style: TextStyle(
                fontSize: headerFontSize
              )),
              onTap: ()=> setState((){
                state = !state;
              }),
            ),
          ],
        ),
        if(!state) ...[
          Row( children: [
            for(String entry in widget.dice)
              if(entry.split("+")[1].validInt())
                Roll(
                  character: widget.character,
                  times: entry.split("d")[0].parseInt(),
                  sides: entry.split(RegExp("[d+]"))[1].parseInt(),
                  statMod: entry.split("+")[1].parseInt(),
                )
              else 
                Roll(
                  character: widget.character,
                  times: entry.split("d")[0].parseInt(),
                  sides: entry.split(RegExp("[d+]"))[1].parseInt(),
                  statName: entry.split("+")[1],
                ),
          ]),
          Text(widget.description.toString()),
          for(MapEntry subaction in widget.character["actions"][widget.name]["subactions"].entries)
            SubAction(
              character: widget.character,
              name: subaction.key,
              description: subaction.value["description"]
            )
        ]
      ]
    );
  }
}