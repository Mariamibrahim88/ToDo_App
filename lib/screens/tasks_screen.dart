import 'package:flutter/material.dart';
import 'package:todo_app/models/task_data.dart';
//import 'package:todo_app/models/tasks.dart';
import 'package:todo_app/widgets/tasks_list.dart';
import 'package:todo_app/screens/add_task_screen.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: AddTaskScreen((newTaskTitle){
                      // setState(() {
                      //   tasks.add(Task(name: newTaskTitle));
                      //   Navigator.pop(context);
                      // });

                    }),
                ),
            ),
          );
        },
        backgroundColor: Colors.deepPurple[300],
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.pinkAccent[200],
      body: Container(
        padding:
            const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.playlist_add_check,size: 50,color: Colors.white,),
                SizedBox(width: 20,),
                Text("ToDayDo",style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold
                ),),
              ],
            ),
            Text('${Provider.of<TaskData>(context).tasks.length} Tasks'
              ,style: TextStyle(
              fontSize: 18,
              color: Colors.white
            ),),
            SizedBox(height: 20,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20),
                  )
                ),
                child: TasksList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

