import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/widgets/counter.dart';
import 'package:todo_app/widgets/new_todo.dart';
import 'package:todo_app/widgets/todo_list.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Todo> todos = [];

  int getNumCompletedTodos() {
    int numCompleted = 0;
    todos.forEach((todo) {
      if (todo.completed) {
        numCompleted++;
      }
    });
    return numCompleted;
  }

  void showAddTodoModel(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (bCtx) {
          return NewTodo(
            addTodoCallback: addTodo,
          );
        });
  }

  void addTodo(String text) {
    setState(() {
      todos.add(Todo(id: Uuid(), text: text, completed: false));
    });
  }

  void markCompleted(int index) {
    setState(() {
      todos[index].completed = !todos[index].completed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo"),
        leading: Icon(Icons.today_outlined),
        leadingWidth: 40,
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Counter(
            total: todos.length,
            numCompleted: getNumCompletedTodos(),
          ),
          TodoList(todos: todos, tapCardCallback: markCompleted),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTodoModel(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
