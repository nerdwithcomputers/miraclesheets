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
    String returnString = "${input["main"]}\n\n";
    for (MapEntry subheading in input.entries.toList()){
      if(subheading.key != "main"){
        returnString += "${subheading.key}-\n${subheading.value}";
      }
    }
    return Text(returnString);
  }
  
  @override
  Widget build(BuildContext context){
    return Expanded(
      child: 
        ListView(
          children: [
            ...widget.character["journal"].entries.toList().map(
              (entry)=> ListTile(
                title: Text(entry.key),
                subtitle: buildDesc(entry.value),
              )
            )
          ],
        )
    );
  }
}