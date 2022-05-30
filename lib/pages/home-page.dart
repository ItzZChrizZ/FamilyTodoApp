// ignore_for_file: file_names

import 'package:familytodoapp/components/homepage/todo-list-widget.dart';
import 'package:familytodoapp/constants.dart';
import 'package:familytodoapp/main.dart';
import 'package:familytodoapp/pages/todo-page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [
      const TodoListWidget(),
      Container(),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.appBarColor,
        title: Text(
          MyApp.title,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Constants.navBarColor,
        unselectedItemColor: Constants.iconColors.withOpacity(0.7),
        selectedItemColor: Constants.iconColors,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.fact_check_outlined,
            ),
            label: "Todos",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.done,
              size: 28.0,
            ),
            label: "Todos",
          ),
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        backgroundColor: Constants.navBarColor,
        child: Icon(
          Icons.add,
          color: Constants.iconColors,
          size: 36,
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TodoPage(),
          ),
        ),
      ),
    );
  }
}
