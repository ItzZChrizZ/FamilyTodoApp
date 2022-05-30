// ignore_for_file: prefer_const_declarations

import 'package:familytodoapp/constants.dart';
import 'package:familytodoapp/database/provider.dart';
import 'package:familytodoapp/pages/home-page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = "Family Todo App";
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => TodosProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(
            textTheme: GoogleFonts.latoTextTheme(),
            scaffoldBackgroundColor: Constants.backgroundColor,
          ),
          home: const HomePage(),
        ),
      );
}
