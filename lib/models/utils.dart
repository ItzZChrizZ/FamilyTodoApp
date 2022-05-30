// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class Utils {
  static showSnackbar(BuildContext context, String text) =>
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(text)));
}
