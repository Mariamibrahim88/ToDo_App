import 'package:flutter/material.dart';
import 'package:todo_app/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';

class TasksList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context,taskData,child){
        return  ListView.builder(
        itemCount: taskData.tasks.length,
        itemBuilder: (context, index) {
        return TaskTile(
        taskTitle: taskData.tasks[index].name,
        isChecked: taskData.tasks[index].isDone,
        checkboxChange :(newValue) {
          taskData.update(taskData.tasks[index]);
        },
          listDeleteTile:(){
          taskData.deleteTask(taskData.tasks[index]);

          },
        );

        },
        );
      },

    );

  }
}
