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
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Column(
              children: [
                Statbar(json: character)
              ],
            )
          ],
        )
      ),
      appBar: AppBar(
        title: Text(character["name"]),
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