import 'package:flutter/material.dart';

class ActionBar extends StatelessWidget {
  final Map character;
  const ActionBar({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Action(actionName: "unarmed strike", character: character)
      ],
    );
  }
}

class Action extends StatefulWidget {
  final Map character;
  final String actionName;
  const Action({
    super.key,
    required this.actionName,
    required this.character
  });
  @override
  State<Action> createState() => ActionState();
}

class ActionState extends State<Action>{
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: [
          Text(widget.actionName),
          
        ],
      ),
      onTap: () => {
        
      },
    );
  }
}