import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final String title;
  final bool completed;
  final Function(bool?) onChanged;
  final Function(DismissDirection?) onDismissed;

  const TaskItem({
    Key? key,
    required this.title,
    required this.completed,
    required this.onChanged,
    required this.onDismissed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Dismissible(
        key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
        background: Container(
          color: Theme.of(context).accentColor,
          child: Align(
            alignment: Alignment(-0.9, 0.0),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
        direction: DismissDirection.startToEnd,
        child: CheckboxListTile(
          checkColor: Colors.white,
          activeColor: Theme.of(context).primaryColor,
          title: Text(title),
          value: completed,
          secondary: Icon(
            completed ? Icons.check_circle : Icons.error,
            color: Theme.of(context).primaryColor,
          ),
          onChanged: onChanged,
        ),
        onDismissed: onDismissed,
      ),
    );
  }
}
