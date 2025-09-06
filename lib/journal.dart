// import 'dart:ffi';

import 'package:flutter/material.dart';

class JournalScreen extends StatefulWidget{
  final Map character;
  const JournalScreen({
    super.key,
    required this.character
  });
  @override
  State<JournalScreen> createState() => JournalState();
}

class JournalState extends State<JournalScreen>{
  Widget buildDesc(Map input){
    List<InlineSpan> returns = [];
    for (MapEntry subheading in input.entries.toList()){
      if(subheading.key != "main"){
        returns.add(
          TextSpan(
            text: " ${subheading.key}-\n",
            style: const TextStyle(
              fontWeight: FontWeight.w100
            )
          )
        );
        returns.add(
          TextSpan(
            text: "  ${subheading.value}\n",
            style: const TextStyle(
              fontWeight: FontWeight.w100
            )
          )
        );
      }
    }
    return RichText(
      text: TextSpan(
        text: "${input["main"]}\n",
        style: DefaultTextStyle.of(context).style,
        children: returns
      )
    );
  }
  
  @override
  Widget build(BuildContext context){
    return Expanded(
      child: 
        ListView(
          children: [
            ...widget.character["journal"].entries.toList().map(
              (entry)=> ListTile(
                title: Text(
                  entry.key,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800
                  ),
                ),
                subtitle: buildDesc(entry.value),
              )
            )
          ],
        )
    );
  }
}