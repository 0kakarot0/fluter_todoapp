import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/component/my_app_bar.dart';
import 'package:todoapp/component/to_do_list.dart';
import 'package:todoapp/data/database.dart';

import '../component/dialog_box.dart';
import '../component/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // hive database reference
  final _myBox = Hive.box("mybox");

  // create instance of the DB class
  ToDoDatabase toDoDatabase = ToDoDatabase();

  // text edit controller
  final taskNameEditingController = TextEditingController();

  @override
  void initState() {
    //if this is first time openning the app, then create default data
    if (_myBox.get("TODOLIST") == null) {
      toDoDatabase.createInitialData();
    } else {
      //if data already exist
      toDoDatabase.loadData();
    }
    super.initState();
  }

  //checkbox was trapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoDatabase.toDoList[index][1] = !toDoDatabase.toDoList[index][1];
    });
    //update the database
    toDoDatabase.updateDatabase();
  }

  // showDialogBox with text fields
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return MyDialogBox(
          hintText: "Add Task",
          controller: taskNameEditingController,
          onSave: saveNewTask,
          onCancel: () {
            // Close the add task box
            Navigator.pop(context);
          },
        );
      },
    );
  }

  //save new task
  void saveNewTask() {
    setState(() {
      toDoDatabase.toDoList.add([taskNameEditingController.text, false]);
    });
    taskNameEditingController.clear();
    Navigator.of(context).pop();

    //update the database
    toDoDatabase.updateDatabase();
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      toDoDatabase.toDoList.removeAt(index);
    });
    //update the database
    toDoDatabase.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const MyAppBar(
        pageTitle: "TO DO",
      ),
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor:
            Theme.of(context).colorScheme.inversePrimary, // Example color

        onPressed: createNewTask,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.tertiary,
          size: 30,
        ),
      ),
      body: ListView.builder(
        itemCount: toDoDatabase.toDoList.length,
        itemBuilder: (context, index) {
          return toDoDatabase.toDoList[index][1] == false
              ? ToDoList(
                  taskName: toDoDatabase.toDoList[index][0],
                  taskCompleted: toDoDatabase.toDoList[index][1],
                  onChanged: (value) => checkBoxChanged(value, index),
                  deleteFunction: (context) => deleteTask(index),
                )
              : const SizedBox.shrink();
        },
      ),
    );
  }
}
