import 'package:flutter/material.dart';
import 'tasks.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'go shopping'),
    Task(name: 'buy a gift'),
    Task(name: 'repair the car'),
  ];

  void addTask (String newTaskTitle){
    tasks.add(Task(name: newTaskTitle));
    notifyListeners();
  }

  void update(Task task){
    task.doneChange();
    notifyListeners();
  }

  void deleteTask (Task task){
    tasks.remove(task);
    notifyListeners();
  }

}