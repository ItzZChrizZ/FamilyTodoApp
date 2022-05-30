// ignore_for_file: file_names

import 'package:familytodoapp/constants.dart';
import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  final String? title;
  final String? description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTodo;
  const TodoFormWidget(
      {Key? key,
      this.title,
      this.description,
      required this.onChangedTitle,
      required this.onChangedDescription,
      required this.onSavedTodo})
      : super(key: key);

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
            buildSaveButton(),
          ],
        ),
      );

  buildTitle() => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18.0,
        ),
        child: TextFormField(
          maxLines: 1,
          initialValue: title,
          onChanged: onChangedTitle,
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
          onChanged: onChangedDescription,
          initialValue: description,
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            labelText: "Description",
            labelStyle: Constants.regulerText,
          ),
        ),
      );

  buildSaveButton() => Padding(
        padding: const EdgeInsets.symmetric(
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
            onPressed: onSavedTodo,
            child: Text(
              "Save",
              style: Constants.titleWhite,
            ),
          ),
        ),
      );
}
