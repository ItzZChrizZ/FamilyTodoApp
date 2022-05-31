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

  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void deleteTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();

    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;

    notifyListeners();
  }
}
