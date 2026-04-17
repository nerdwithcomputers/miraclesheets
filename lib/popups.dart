import 'package:flutter/material.dart';

addEntry(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title:  TextField(
          maxLines: 1,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Title"
          )
        ),
        content: TextField(
          maxLines: null,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Body"
          )
        ),
        actions: [
          ElevatedButton(
            onPressed:(){
              Navigator.of(context).pop(context);
            },
            child: const Text("cancel")
          ),
          ElevatedButton(
            onPressed:(){
              Navigator.of(context).pop(context);
            },
            child: const Text("submit")
          )
        ]
      );
    } 
  );
}
