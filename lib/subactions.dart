import 'package:flutter/material.dart';

class SubAction extends StatefulWidget {
  final Map character;
  final int? passthrough;
  final String name;
  final String description;
  const SubAction({
    super.key,
    required this.character,
    required this.name,
    required this.description,
    this.passthrough
  });
  @override
  State<SubAction> createState()=> SubActionState();
}

class SubActionState extends State<SubAction>{
  @override
  Widget build(BuildContext context) {
    return(
      Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.white),
          borderRadius: const BorderRadius.all(Radius.elliptical(20,10))
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            Row(
              children: [
                Text("${widget.name}  ", style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400
                )),
                Text(widget.passthrough.toString())
              ],
            ),
            Text(widget.description.toString())
          ],
        ),
      )
    );
  }
}