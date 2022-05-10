import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  const Counter({Key? key, required this.total, required this.numCompleted})
      : super(key: key);

  final int total;
  final int numCompleted;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "$numCompleted/$total",
        style: TextStyle(
            fontSize: 30,
            color: total == numCompleted ? Colors.green : Colors.grey),
      ),
      margin: EdgeInsets.all(20),
    );
  }
}
