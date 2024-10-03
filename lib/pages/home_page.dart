import 'package:flutter/material.dart';
import 'package:to_do_app/utilities/dialog_box.dart';
import 'package:to_do_app/utilities/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List toDoList = [
    ['make Tutorial', false],
    ['do som', true],
  ];

  final _controller = TextEditingController();

  void checkboxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.pop(context);
  }

  void addTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onCancel: () {
              Navigator.pop(context);
              _controller.clear();
            },
            onSave: () {
              saveNewTask();
            },
          );
        });
  }

  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 228, 131),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 199, 30),
          title: const Text('TO DO'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            addTask();
          },
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: toDoList.length,
            itemBuilder: (context, index) {
              return ToDoTile(
                taskName: toDoList[index][0],
                isCompleted: toDoList[index][1],
                onChanged: (value) => checkboxChanged(value, index),
                deleteFunction: (p0) => deleteTask(index),
              );
            }));
  }
}
