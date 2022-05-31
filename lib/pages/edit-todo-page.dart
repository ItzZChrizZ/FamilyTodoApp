// ignore_for_file: file_names

import 'package:familytodoapp/constants.dart';
import 'package:familytodoapp/models/todo-form-widget.dart';
import 'package:familytodoapp/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../database/provider.dart';

class EditTodoPage extends StatefulWidget {
  final Todo todo;
  const EditTodoPage({Key? key, required this.todo}) : super(key: key);

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  final _formKey = GlobalKey<FormState>();
  String? title;
  String? description;

  @override
  void initState() {
    super.initState();

    title = widget.todo.title;
    description = widget.todo.description;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            "Edit Todo",
            style: Constants.titleWhite,
          ),
          backgroundColor: Constants.appBarColor,
          actions: [
            IconButton(
              onPressed: () {
                final provider =
                    Provider.of<TodosProvider>(context, listen: false);
                provider.deleteTodo(widget.todo);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TodoFormWidget(
              title: title,
              description: description,
              onChangedTitle: (title) => setState(() {
                this.title = title;
              }),
              onChangedDescription: (description) => setState(() {
                this.description = description;
              }),
              onSavedTodo: saveTodo,
            ),
          ),
        ),
      );

  void saveTodo() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.updateTodo(widget.todo, title!, description!);

      Navigator.pop(context);
    }
  }
}
