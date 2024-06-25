import 'package:flutter/material.dart';
import 'package:taskmanagment/core/view/home/widgets/task_card.dart';

import '../task/add_task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List toDoList = [
    ['Swim', true],
    ['Learn Flutter', true],
    ['Drink Coffee', false],
    ['Explore Firebase', false],
  ];



  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Simple Todo',
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (BuildContext context, index) {
          return TodoList(
            taskName: toDoList[index][0],
            onTap: () {},
            deleteFunction: (contex) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
        () {
          Navigator.push(
            context,
             MaterialPageRoute(
              builder: (context) => AddTaskScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
