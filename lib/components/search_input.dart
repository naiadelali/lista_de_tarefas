import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  final TextEditingController toDoController;
  final Function()? addToDo;


  const SearchInput({
    Key? key,
    required this.toDoController,
    required this.addToDo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: toDoController,
              decoration: InputDecoration(
                labelText: "Nova Tarefa",
                labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 12),
              ),
            ),
          ),
          TextButton(
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor,
              textStyle: TextStyle(fontSize: 16),
              onPrimary: Colors.white,
            ),
            child: Text(
              "ADD",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
                fontSize: 12,
              ),
            ),
            onPressed: addToDo,
          )
        ],
      ),
    );
  }
}
