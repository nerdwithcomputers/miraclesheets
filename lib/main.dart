import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:miraclesheets/stats.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "miraclesheets",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red, brightness: Brightness.dark)
      ),
      home: const Center(
        child: HomeApp()
      ),
    );
  }
}

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    String char = File('lib/assets/sample-char/main.json').readAsStringSync();
    Map character = jsonDecode(char);
    String classes = "";
    var level = 0;
    for(String entry in character["class"]){
      var classLevel = entry.split(";");
      level += int.parse(classLevel[1]);
      classes += classes.isEmpty ? " ${classLevel[0]}" : "-${classLevel[0]}";
    }
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Column(
              children: [
                const Text("stats"),
                const Spacer(),
                Statbar(character: character),
                const Spacer(),
                const Spacer(),
                const Spacer(),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                const Text("actions"),
                
              ],
            ),
            const Spacer()
          ],
        )
      ),
      appBar: AppBar(
        title: Row(
          children: [
            Text(character["name"]),
            Text(classes),
            Text(" ${level.toString()}")
          ]
        ),
        actions: [
          ElevatedButton(
            onPressed: (){

            },
            child: const Text("Main")
          ),
          ElevatedButton(
            onPressed: (){
              
            },
            child: const Text("Actions")
          ),
          ElevatedButton(
            onPressed: (){
              
            },
            child: const Text("Spells")
          ),
          ElevatedButton(
            onPressed: (){
              
            },
            child: const Text("Inventory")
          ),
          ElevatedButton(
            onPressed: (){
              
            },
            child: const Text("Features")
          ),
          ElevatedButton(
            onPressed: (){
              
            },
            child: const Text("Notes")
          ),
        ],
      )
    );
  }       
}