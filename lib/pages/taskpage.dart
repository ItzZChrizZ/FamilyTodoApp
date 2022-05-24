import 'package:familytodoapp/components/homepage/taskcardwidget.dart';
import 'package:familytodoapp/constants.dart';
import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 24.0,
                bottom: 6.0,
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: (() {
                      Navigator.pop(context);
                    }),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.arrow_back,
                        size: 38,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter Task Title",
                        hintStyle: Constants.regulerHeader,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter Description for the Task",
                hintStyle: Constants.regulerLine,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                ),
              ),
            ),
            const TodoWidget(),
          ],
        ),
      ),
    );
  }
}
