import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  //initialize the empty toDoList
  List toDoList = [];

  //reference the box
  final _myBox = Hive.box("mybox");

  // run this method if this is the first time ever openning the app
  void createInitialData() {
    toDoList = [
      ["Make Tutorials", false],
      ["Do Exercise", false],
    ];
  }

  //load the data from the database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  //update the database
  void updateDatabase() {
    _myBox.put("TODOLIST", toDoList);
  }

  //is task completed
  bool isTaskCompleted() {
    for (var task in toDoList) {
      // task[1] represents the completion status of the current task
      if (task[1] == false) {
        // If any task is incomplete, return false
        return false;
      }
    }
    // If all tasks are completed, return true
    return true;
  }

}
