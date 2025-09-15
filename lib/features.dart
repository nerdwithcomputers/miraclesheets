import 'package:flutter/material.dart';

Widget FeatureDesciption(Map character){
  return Flexible(
    child: ListView(
      children: [
        ...character["features"].keys.toList().map((name)=>
          ListTile(
            title: Text("$name -"),
            subtitle: Text(character["features"][name]),
            // style: ListTileStyle.drawer,
          )
        )
      ],
    )
  );
}