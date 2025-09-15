import 'package:flutter/material.dart';

class AddEntry extends StatelessWidget{
  const AddEntry({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text("Back")
            ),
            const JournalChanger()
          ],
        ),
      )
    );
  }
}

class JournalChanger extends StatefulWidget{
  const JournalChanger({
    super.key,
  });
  @override
  State<JournalChanger> createState() => JournalChangerState();
}

class JournalChangerState extends State<JournalChanger>{
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: "main body of the note"
            ),
            
          )
        ],
      )
    );
  }
}