// ignore_for_file: file_names, prefer_if_null_operators, unnecessary_null_comparison

import 'package:familytodoapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeWidget extends StatefulWidget {
  const DateTimeWidget({Key? key}) : super(key: key);

  @override
  State<DateTimeWidget> createState() => _DateTimeWidgetState();
}

class _DateTimeWidgetState extends State<DateTimeWidget> {
  late DateTime _myDateTime;
  String time = "?";
  @override
  Widget build(BuildContext context) => Padding(
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
              _myDateTime = (await showDatePicker(
                context: context,
                initialDate: _myDateTime == null ? DateTime.now() : _myDateTime,
                firstDate: DateTime(2010),
                lastDate: DateTime(2030),
              ))!;
              setState(() {
                time = DateFormat("dd-MM-yy").format(_myDateTime);
              });
              Navigator.of(context).pop(time);
            },
            child: Text(
              "DateTime",
              style: Constants.titleWhite,
            ),
          ),
        ),
      );
}
