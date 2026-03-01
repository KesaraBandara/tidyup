import 'package:hive/hive.dart';
import 'package:tidyup/models/todo_model.dart';

class TodoService {
  List<Todo> todos = [
    Todo(
      title: "Read a Book",
      date: DateTime.now(),
      time: DateTime.now(),
      isDone: true,
    ),
    Todo(
      title: "Go for a Walk",
      date: DateTime.now(),
      time: DateTime.now(),
      isDone: false,
    ),
    Todo(
      title: "Complete Assignment",
      date: DateTime.now(),
      time: DateTime.now(),
      isDone: false,
    ),
  ];

  //create the database reference for todos

  final _myBox = Hive.box('todos');

  //check weather the user is new user
  Future<bool> isNewUser() async {
    return _myBox.isEmpty;
  }

  // Method to create the initial todos if the box is empty
  Future<void> createInitialTodos() async {
    if (_myBox.isEmpty) {
      await _myBox.put("todos", todos);
    }
  }
}
