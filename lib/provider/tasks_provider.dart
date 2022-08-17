import 'package:flutter/material.dart';
import 'package:todo_c6_sat/my_database.dart';
import 'package:todo_c6_sat/task.dart';

class TasksProvider extends ChangeNotifier{
  List<Task> tasks = [];
  var date = DateTime.now();
  TasksProvider(){
    retrieveTasks();
   }
  void retrieveTasks([DateTime? newDateTime= null])async{
    if(newDateTime!=null)
      date = newDateTime;
    var tasksQuerySnapshot =await MyDataBase.getTasks(date);
    tasks = tasksQuerySnapshot.docs.map((e) => e.data()).toList();
    notifyListeners();
  }

}