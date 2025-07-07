import 'package:flutter/material.dart';

class ActionBar extends StatelessWidget {
  final Map character;
  const ActionBar({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

      ],
    )
  }
}

class Action extends StatelessWidget{
  final Map character;
  final String actionName;
  const Action({super.key, required this.actionName, required this.character});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(actionName),
        
      ],
    )
  }
}