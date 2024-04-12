import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/component/my_app_bar.dart';
import 'package:todoapp/component/to_do_list.dart';
import 'package:todoapp/utils/date_formatter.dart';

import '../data/database.dart';
import '../utils/delete_task.dart';

class ArchivePage extends StatefulWidget {
  const ArchivePage({super.key});

  @override
  State<ArchivePage> createState() => _ArchivePageState();
}

class _ArchivePageState extends State<ArchivePage> {
  // hive database reference
  final _myBox = Hive.box("mybox");

  // create instance of the DB class
  ToDoDatabase toDoDatabase = ToDoDatabase();

  MyDateFormatter dataFormatter = MyDateFormatter();

  @override
  void initState() {
    toDoDatabase.loadData();

    super.initState();
  }



  //delete task
  //delete task
  void deleteTask(int index) {
    TaskDeleter deleteTask = TaskDeleter();
    setState(() {
      deleteTask.deleteTask(toDoDatabase, index);
    });
  }

  // TODO Implement the Filter According to month

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(pageTitle: "Completed Tasks"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 10),
            child: Row(
              children: [
                Text(
                  dataFormatter.formatDate(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: toDoDatabase.toDoList.length,
            itemBuilder: (context, index) {
              return toDoDatabase.toDoList[index][1] == true
                  ? ToDoList(
                      taskName: toDoDatabase.toDoList[index][0],
                      taskCompleted: toDoDatabase.toDoList[index][1],
                      onChanged: null,
                      deleteFunction: (context) => deleteTask(index),
                    )
                  : const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
