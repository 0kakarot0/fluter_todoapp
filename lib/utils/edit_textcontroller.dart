import 'package:flutter/cupertino.dart';
import 'package:todoapp/data/database.dart';

class EditTextEditController {
  void editTextEditController(
      ToDoDatabase toDoDatabase, TextEditingController textEditingController, int index) {
    //update the task
    toDoDatabase.toDoList[index][0] = textEditingController.text;

    //clear the text edit
    textEditingController.clear();

    //update the database
    toDoDatabase.updateDatabase();
  }
}
