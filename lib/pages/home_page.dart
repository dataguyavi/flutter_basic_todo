import 'package:flutter/material.dart';
import 'package:flutter_basic_todo/pages/components/task_tile.dart';
import 'package:flutter_basic_todo/pages/utils/button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Variable
  List tasks = []; // Acts as local storage

  TextEditingController taskTitleController = TextEditingController();

  // Function
  void toggleCheckbox(bool? value, int index) {
    setState(() {
      tasks[index][1] = !tasks[index][1];
    });

    return;
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void addTask() {
    showDialog(context: context, builder: (context) =>  SimpleDialog(
      shape: const BeveledRectangleBorder(),
      backgroundColor: Colors.orangeAccent.shade100,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: taskTitleController,
            cursorColor: Colors.orangeAccent.shade700,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orangeAccent.shade400)
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orangeAccent.shade700)
              ),
              hintText: 'Task title...'
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyButton(text: 'Save', onPressed: () {
                setState(() {
                  tasks.add([taskTitleController.text, false]);
                });

                Navigator.of(context).pop();

                taskTitleController.clear();
              }),
              MyButton(text: 'Cancel', onPressed: () {
                Navigator.of(context).pop();
              }),
            ],
          ),
        )
      ],
    ));

    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Let's get 'em DONE"),
        backgroundColor: Colors.orangeAccent.shade400,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addTask(),
        backgroundColor: Colors.orangeAccent.shade400, 
        child: const Icon(
          Icons.add
        ),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskTile(taskTitle: tasks[index][0], taskStatus: tasks[index][1], onChanged: (value) => toggleCheckbox(value, index), onDelete: (context) => deleteTask(index));
        },
        prototypeItem: TaskTile(taskTitle: 'taskTitle', taskStatus: false, onChanged: (value) => toggleCheckbox(value, 0), onDelete: (context) => deleteTask(0)),
      ),
    );
  }
}