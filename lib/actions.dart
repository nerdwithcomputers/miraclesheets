import 'package:flutter/material.dart';
import 'package:miraclesheets/dice.dart';
import 'package:miraclesheets/main.dart';

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
          bonus: "+2",
          damage: "",
          description: "punch or kick or something",
        )
      ],
    );
  }
}

class Action extends StatefulWidget {
  final Map character;
  final String actionName;
  final String bonus;
  final String? damage;
  final String? description;
  const Action({
    super.key,
    required this.character,
    required this.actionName,
    required this.bonus,
    this.damage,
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
              if(widget.bonus.validInt()) 
                Roll(
                  character: widget.character,
                  sides: 20,
                  statMod: widget.bonus.parseInt()
                ),
              if(!widget.bonus.validInt())
                Roll(
                  character: widget.character,
                  sides: 20,
                  statName: widget.bonus
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