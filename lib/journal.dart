// import 'dart:ffi';
import 'package:miraclesheets/popups.dart';

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
    List<Widget> returns = [];
    for (MapEntry subheading in input.entries.toList()){
      if(subheading.key != "main"){
        returns.add(
          Text(
            "  ${subheading.key}-",
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontWeight: FontWeight.w300
            )
          )
        );
        returns.add(
          Text(
            "${subheading.value}",
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontWeight: FontWeight.w100
            )
          )
        );
      }
    }
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(input["main"])
        ),
        ...returns.map(
          (e)=>Align(
            alignment: const Alignment(-0.999,0),
            child: e
          )
        )
      ],
    );
  }
  
  @override
  Widget build(BuildContext context){
    return Flexible(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (context)=> const AddEntry()
              ));
            },
            child: const Text("+")
          ),
          Flexible(
            child: ListView(
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
          ), // WAAAARGHHH
        ]
      )
    );
  }
}