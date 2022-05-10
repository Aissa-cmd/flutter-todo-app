import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class TododCard extends StatelessWidget {
  const TododCard(
      {Key? key,
      required this.id,
      required this.text,
      required this.completed,
      required this.tapCardCallback,
      required this.index})
      : super(key: key);

  final Uuid id;
  final String text;
  final bool completed;
  final int index;

  final Function(int index) tapCardCallback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        tapCardCallback(index);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Card(
          child: Container(
            child: Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      text,
                    ),
                    Icon(
                      completed ? Icons.check : Icons.close,
                      color: completed ? Colors.green : Colors.red,
                    ),
                  ]),
            ),
            padding: EdgeInsets.all(20),
            height: 125,
          ),
        ),
      ),
    );
  }
}
