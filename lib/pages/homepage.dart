// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:familytodoapp/components/homepage/taskcardwidget.dart';
import 'package:familytodoapp/database/database_helper.dart';
import 'package:familytodoapp/pages/taskpage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DataBaseHelper _dbHelper = DataBaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          color: Colors.white30,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 32.0,
                      top: 32.0,
                    ),
                    child: const Icon(
                      FontAwesomeIcons.apple,
                      size: 32,
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder(
                      future: _dbHelper.getTasks(),
                      builder: (context, snapshot) {
                        return ListView.builder(
                          itemCount: (snapshot.data as Map).length,
                          itemBuilder: (context, index) {
                            if (snapshot.hasData) {
                              var myData = snapshot.data as List;
                              return TaskCardWidget(
                                title: myData[index].title,
                              );
                            }
                            return const CircularProgressIndicator();
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 24.0,
                right: 0.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TaskPage()))
                        .then((value) => {
                              setState(() {}),
                            });
                  },
                  child: Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(
                      FontAwesomeIcons.plus,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
