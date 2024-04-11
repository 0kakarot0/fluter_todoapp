import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/component/my_app_bar.dart';
import 'package:todoapp/component/to_do_list.dart';

import '../data/database.dart';

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

  @override
  void initState() {
    toDoDatabase.loadData();

    // TODO: implement initState
    super.initState();
  }

  //empty function
  void emptyFunction() {}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(pageTitle: "Completed Tasks"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: toDoDatabase.toDoList.length,
              itemBuilder: (context, index) {
                return toDoDatabase.toDoList[index][1] == true
                    ? ToDoList(
                        taskName: toDoDatabase.toDoList[index][0],
                        taskCompleted: toDoDatabase.toDoList[index][1],
                        onChanged: null,
                        deleteFunction: null,
                      )
                    : const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
