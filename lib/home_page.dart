
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
          SearchInput(
            addToDo: _addToDo,
            toDoController: _toDoController,
          ),
          Expanded(
            child: ListTask(
              itemCount: _toDoList.length,
              onChanged: (value, index) {
                setState(() {
                  _toDoList[index].completed = value ?? false;
                });
              },
              onDismissed: (direction, index) {
                setState(() {
                  _toDoList.removeAt(index);
                });
              },
              toDoList: _toDoList,
            ),
          ),
        ],
      ),
    );
  }
}
