import 'package:familytodoapp/pages/home-page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'database/provider.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = "Family Todo App";
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
