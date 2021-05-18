import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/task_model.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'Poppins',
      primaryColor: Color(0xFFC1007E),
      accentColor: Color(
        0xFF919191,
      ),
    ),
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _toDoController = TextEditingController();

  List<TaskModel> _toDoList = [];
  @override
  void initState() {
    super.initState();
  }

  void _addToDo() {
    setState(() {
      var newToDo = TaskModel(_toDoController.text, false);
      _toDoList.add(newToDo);
      _toDoController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset(
                'assets/images/logo_home.png',
              ),
            ),
            Text(
              "Lista de Tarefas",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _toDoController,
                    decoration: InputDecoration(
                      labelText: "Nova Tarefa",
                      labelStyle: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 12),
                    ),
                  ),
                ),
                ElevatedButton(
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
                  onPressed: _addToDo,
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.only(top: 10.0),
                itemCount: _toDoList.length,
                itemBuilder: buildItem),
          )
        ],
      ),
    );
  }

  Widget buildItem(BuildContext context, int index) {
    return Dismissible(
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
        title: Text(_toDoList[index].text),
        value: _toDoList[index].completed,
        secondary: Icon(
          _toDoList[index].completed ? Icons.check_circle : Icons.error,
          color: Theme.of(context).primaryColor,
        ),
        onChanged: (c) {
          setState(() {
            _toDoList[index].completed = c!;
          });
        },
      ),
      onDismissed: (direction) {
        setState(() {
          _toDoList.removeAt(index);
        });
      },
    );
  }
}
