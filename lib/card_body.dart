import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final Color colour;
  final content;

  MyCard({@required this.colour, this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: content,
      margin: EdgeInsets.all(7.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }
}
