import 'package:uuid/uuid.dart';

class Todo {
  Uuid id;
  String text;
  bool completed;

  Todo({required this.id, required this.text, required this.completed});
}
