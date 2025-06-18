import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "miraclesheets",
      home: Scaffold(
        body: HomeApp()
      )
    );
  }
}

class HomeApp extends StatelessWidget {
  const HomeApp({super.key})

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("data"),
        )
      )
    );
  }
}