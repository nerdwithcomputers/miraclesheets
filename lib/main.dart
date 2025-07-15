import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:miraclesheets/actions.dart';
import 'package:miraclesheets/stats.dart';

List<Widget> chatList = [];

void main() {
  runApp(const MainApp());
}

extension StringParse on String {
  int parseInt(){
    return int.parse(this);
  }
  bool validInt(){
    var val = int.tryParse(this);
    if(val==null){
      return false;
    } else {
      return true;
    }
  }
}
extension CalcMod on int {
  String parseModString(){
    // rounding sucks.
    var diff = this - 10;
    var sign = diff<0 ? "-" : "+";
    if(((diff%2) != 0) && (sign=="-")){
      diff -= 1;
    }
    var mod = diff.abs() ~/ 2;
    var modifier = "$sign$mod";
    return modifier;
  }
  int parseModInt(){
    // rounding sucks slightly less.
    var diff = this - 10;
    var sign = diff<0 ? "-" : "+";
    if(((diff%2) != 0) && (sign=="-")){
      diff -= 1;
    }
    var mod = diff.abs() ~/ 2;
    return mod;
  }
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
      // ignore: prefer_const_constructors
      home: const Center(
        child: HomeApp()
      ),
    );
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => HomeState();
}

class HomeState extends State<HomeApp>{
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
                ActionBar(character: character),
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