import 'package:flutter/material.dart';

Widget ListViewBuild(Map input, Widget Function() Tile){
  return Expanded(
    child: ListView(
      children: [
        ...input.keys.toList().map((name) => 
          Tile(
            
          )
        )
      ],
    )
  );
}