import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/widgets/cards.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key, required this.todos, required this.tapCardCallback})
      : super(key: key);

  final List<Todo> todos;

  final Function(int index) tapCardCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemBuilder: (context, idx) {
          return TododCard(
            id: todos[idx].id,
            text: todos[idx].text,
            completed: todos[idx].completed,
            index: idx,
            tapCardCallback: tapCardCallback,
          );
        },
        itemCount: todos.length,
      ),
    );
  }
}
