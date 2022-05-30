import 'package:familytodoapp/models/todo.dart';
import 'package:flutter/material.dart';

class TodosProvider extends ChangeNotifier {
  // ignore: prefer_final_fields
  List<Todo> _todos = [
    Todo(
      createdTime: DateTime.now(),
      title: "Walk the Dog ",
      id: '',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: "Walk the Dog ",
      id: '',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: "Walk the Dog ",
      id: '',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: "Walk the Dog ",
      id: '',
    ),
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void deleteTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }
}
