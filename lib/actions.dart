import 'package:flutter/material.dart';
import 'package:miraclesheets/dice.dart';
import 'package:miraclesheets/extensions.dart';

class ActionBar extends StatelessWidget {
  final Map character;
  const ActionBar({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Action(
          character: character,
          actionName: "unarmed strike",
          dice: "0",
          description: "punch or kick or something",
        ),
        for(var entry in character["actions"])
          Action(
            character: character,
            actionName: entry["name"],
            dice: entry["bonus"],
            description: entry["description"],
          )
      ],
    );
  }
}

class Action extends StatefulWidget {
  final Map character;
  final String actionName;
  final String dice;
  final String? description;
  const Action({
    super.key,
    required this.character,
    required this.actionName,
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
    return InkWell(
      child: Row(
        children: [
          Text(widget.actionName),
          if(!state) Column(
            children: [
              if(widget.dice.validInt()) 
                Roll(
                  character: widget.character,
                  sides: 20,
                  statMod: widget.dice.parseInt()
                ),
              if(!widget.dice.validInt())
                Roll(
                  character: widget.character,
                  sides: 20,
                  statName: widget.dice
                ),
              Text(" ${widget.description.toString()}")
            ],
          )
        ],
      ),
      onTap: () {
        setState(() {
          state = !state;
        });
      },
    );
  }
}