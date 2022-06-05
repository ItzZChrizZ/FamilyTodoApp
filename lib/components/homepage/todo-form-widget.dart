// ignore_for_file: file_names, sized_box_for_whitespace

import 'package:familytodoapp/constants.dart';
import 'package:flutter/material.dart';

class TodoFormWidget extends StatefulWidget {
  final String? title;
  final String? description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTodo;
  final DateTime? selectedTime;
  final VoidCallback onSavedTime;

  const TodoFormWidget({
    Key? key,
    this.title,
    this.description,
    required this.onChangedTitle,
    required this.onChangedDescription,
    required this.onSavedTodo,
    this.selectedTime,
    required this.onSavedTime,
  }) : super(key: key);

  @override
  State<TodoFormWidget> createState() => _TodoFormWidgetState();
}

class _TodoFormWidgetState extends State<TodoFormWidget> {
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildTitle(),
            const SizedBox(
              height: 10,
            ),
            buildDescription(),
            const SizedBox(
              height: 10,
            ),
            buildDateTime(),
            const SizedBox(
              height: 10,
            ),
            buildSelectedTime(),
            const SizedBox(
              height: 10,
            ),
            buildSaveButton(),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      );

  buildTitle() => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18.0,
        ),
        child: TextFormField(
          maxLines: 1,
          initialValue: widget.title,
          onChanged: widget.onChangedTitle,
          validator: (title) {
            if (title!.isEmpty) {
              return "The title cannot be empty.";
            }
            return null;
          },
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            labelText: "Title",
            labelStyle: Constants.title,
          ),
        ),
      );

  buildDescription() => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18.0,
        ),
        child: TextFormField(
          maxLines: 3,
          onChanged: widget.onChangedDescription,
          initialValue: widget.description,
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            labelText: "Description",
            labelStyle: Constants.regulerText,
          ),
        ),
      );

  buildSaveButton() => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 18.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
          ),
          width: 150.0,
          height: 45.0,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Constants.appBarColor),
            ),
            onPressed: widget.onSavedTodo,
            child: Text(
              "Save",
              style: Constants.titleWhite,
            ),
          ),
        ),
      );

  buildSelectedTime() => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 18.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
          ),
          width: 150.0,
          height: 45.0,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Constants.appBarColor),
            ),
            onPressed: () async {
              DateTime? newTime = await showDatePicker(
                context: context,
                initialDate: date,
                firstDate: DateTime(2020),
                lastDate: DateTime(2030),
              );
              if (newTime == null) return;
              setState(() {
                newTime = date;
              });
            },
            child: Text(
              "Select Time",
              style: Constants.titleWhite,
            ),
          ),
        ),
      );

  buildDateTime() => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18.0,
        ),
        child: Text(
          "$date",
          style: Constants.subTitle,
        ),
      );
}
