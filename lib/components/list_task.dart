import 'package:flutter/material.dart';

import 'task_item.dart';

class ListTask extends StatelessWidget {
  final int itemCount;
  final List toDoList;
  final Function(bool?, int) onChanged;
  final Function(DismissDirection?, int) onDismissed;

  const ListTask({
    Key? key,
    required this.itemCount,
    required this.toDoList,
    required this.onChanged,
    required this.onDismissed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.only(top: 10.0),
        itemCount: itemCount,
        itemBuilder: (_, index) {
          return TaskItem(
            completed: toDoList[index].completed,
            onChanged: (v) => onChanged(v, index),
            onDismissed: (direction) => onDismissed(direction, index),
            title: toDoList[index].text,
          );
        },
      ),
    );
  }
}
