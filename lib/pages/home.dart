import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List todoList = [];
  String _userTodo = '';

  @override
  void initState() {
    super.initState();

    todoList
        .addAll(['test - 1', 'test - 2', 'test - 3', 'test - 4', 'test - 5']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black45,
        title: Text("Todo list"),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
              key: Key(todoList[index]),
              onDismissed: (direction) {
                setState(() {
                  todoList.removeAt(index);
                });
              },
              child: Card(
                child: ListTile(
                  title: Text(
                    todoList[index],
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          todoList.removeAt(index);
                        });
                      },
                      icon: Icon(
                        Icons.delete_outline,
                        color: Colors.white,
                      )),
                ),
                color: Colors.black45,
              ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.black45,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Add element'),
                  content: TextField(
                    onChanged: (String value) {
                      _userTodo = value;
                    },
                  ),
                  actions: [
                    ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() {
                            todoList.add(_userTodo);
                          });
                        },
                        icon: Icon(Icons.add),
                        label: Text('Add')),
                  ],
                );
              });
        },
      ),
    );
  }
}
