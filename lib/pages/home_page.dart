import 'package:flutter/material.dart';
import 'package:todoapp/component/my_app_bar.dart';
import 'package:todoapp/component/to_do_list.dart';

import '../component/dialog_box.dart';
import '../component/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final taskNameEditingController = TextEditingController();

  //list of the To Do task
  List toDoList = [
    ["Make Tutorials", false],
    ["Eat Food", true],
  ];

  //checkbox was trapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
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
    bool isTaskExist =
        toDoList.any((task) => task[0] == taskNameEditingController.text);

    if (!isTaskExist) {
      setState(() {
        toDoList.add([taskNameEditingController.text, false]);
      });
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Task Already Exist"),
        ),
      );
      taskNameEditingController.clear();
      Navigator.of(context).pop();
    }
  }

  //delete task
  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });


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
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoList(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
