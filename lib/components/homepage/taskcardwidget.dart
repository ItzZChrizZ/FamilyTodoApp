import 'package:familytodoapp/constants.dart';
import 'package:flutter/material.dart';

class TaskCardWidget extends StatelessWidget {
  final String? title;
  final String? description;
  const TaskCardWidget({Key? key, this.title, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 32.0,
        horizontal: 24.0,
      ),
      margin: const EdgeInsets.only(
        bottom: 20.0,
      ),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? "(Unnamed Task)",
            style: Constants.regulerHeader,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15.0,
            ),
            child: Text(
              description ?? "No Description Added.",
              style: Constants.regulerLine,
            ),
          ),
        ],
      ),
    );
  }
}

class TodoWidget extends StatelessWidget {
  const TodoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            "Todo Widget",
            style: Constants.regulerLine,
          ),
        ],
      ),
    );
  }
}
