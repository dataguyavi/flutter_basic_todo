import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskTile extends StatelessWidget {
  // Constructor with props
  const TaskTile({
    super.key,
    required this.taskTitle,
    required this.taskStatus,
    required this.onChanged,
    required this.onDelete
  });

  // local variables -> passed from parent
  final String taskTitle;
  final bool taskStatus;

  // Local function -> passed from parent
  final void Function(bool?)? onChanged;
  final void Function(BuildContext)? onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8, left: 8, right: 8),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),  
          children: [
            SlidableAction(
              onPressed: onDelete,
              icon: Icons.delete,
              backgroundColor: Colors.red,
            )
          ]
        ),
        child: Container(
          color: Colors.orangeAccent.shade200,
          child: Row (
            children: [
              // Checkbox
              Checkbox(value: taskStatus, onChanged: onChanged),
              // Title
              Text(
                taskTitle,
                style: TextStyle(
                  decoration: taskStatus ? TextDecoration.lineThrough : null,
                  color: taskStatus ? Colors.black45 : Colors.black
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}