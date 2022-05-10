import 'package:flutter/material.dart';

class NewTodo extends StatefulWidget {
  const NewTodo({Key? key, required this.addTodoCallback}) : super(key: key);

  final Function(String text) addTodoCallback;

  @override
  State<NewTodo> createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  TextEditingController _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Column(
        children: <Widget>[
          TextField(
            controller: _todoController,
            decoration: InputDecoration(labelText: "New todo"),
            maxLength: 50,
          ),
          Container(
            child: TextButton(
                onPressed: () {
                  widget.addTodoCallback(_todoController.text);
                  Navigator.of(context).pop();
                },
                child: Text("Add")),
            margin: EdgeInsets.only(top: 25),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
      ),
      padding: EdgeInsets.all(20),
    );
  }
}
