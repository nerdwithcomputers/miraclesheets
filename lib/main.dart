import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:miraclesheets/actions.dart';
import 'package:miraclesheets/features.dart';
import 'package:miraclesheets/stats.dart';

List<Widget> chatList = [];

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
      
      home: const HomePage()
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomeState();
}

class HomeState extends State<HomePage>{
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
          // shrinkWrap: true,
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
            Descriptions(character:character),
            ActionBar(character:character)
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
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: chatList
        ),
      )
    );
  }
}
