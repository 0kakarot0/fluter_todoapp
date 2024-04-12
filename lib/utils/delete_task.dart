import 'package:hive/hive.dart';
import 'package:todoapp/data/database.dart';

class TaskDeleter {
  // hive database reference
  final _myBox = Hive.box("mybox");


  //delete task
  void deleteTask(ToDoDatabase toDoDatabase,int index) {
    toDoDatabase.toDoList.removeAt(index);

    //update the database
    toDoDatabase.updateDatabase();
  }
}
