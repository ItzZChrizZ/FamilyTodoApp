// ignore_for_file: file_names, avoid_unnecessary_containers

import 'package:familytodoapp/constants.dart';
import 'package:familytodoapp/database/provider.dart';
import 'package:familytodoapp/components/homepage/todo-form-widget.dart';
import 'package:familytodoapp/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  String title = "";
  String description = "";
  DateTime? selectedTime;
  DateTime? date;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Constants.appBarColor,
            centerTitle: true,
            title: Text(
              "New Todo",
              style: Constants.titleWhite,
            ),
          ),
          body: Column(
            children: [
              TodoFormWidget(
                onChangedTitle: (title) => setState(() => this.title = title),
                onChangedDescription: (description) =>
                    setState(() => this.description = description),
                onChangedSelectedTime: (date) => setState(() {
                  selectedTime = date;
                }),
                onSavedTodo: addTodo,
              ),
            ],
          ),
        ),
      );

  void addTodo() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final todo = Todo(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        createdTime: DateTime.now(),
        selectedTime: date,
      );

      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.addTodo(todo);

      Navigator.of(context).pop();
    }
  }
}
