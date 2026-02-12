import 'package:flutter/material.dart';

addEntry(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("add entry"),
        content: TextField(
          maxLines: null
        ),
        actions: [
          ElevatedButton(
            onPressed: (){
              
            }
          )
        ]
      )
    } 
  )
}
