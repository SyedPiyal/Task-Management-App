import 'package:flutter/material.dart';
import 'package:taskmanagment/core/view/home/widgets/task_card.dart';
import 'package:taskmanagment/utils/extensions/context_ext.dart';

import '../../model/task_list.dart';
import '../../service/auth_service.dart';
import '../../service/task_service.dart';
import '../task/add_task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // for future builder ----------------------
  // Future<TaskListResponse>? _taskListFuture;

  List<TaskData> _taskList = [];
  bool _isLoading = true;
  String? _errorMessage;

  final TaskService _taskService = TaskService();
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _loadTasks();
    });
  }

  void _loadTasks() async {
    try {
      String? token = await _authService.getToken();
      if (token != null) {
        TaskListResponse listResponse = await _taskService.fetchTasks(token);
        setState(() {
          _taskList = listResponse.data ?? [];
          _isLoading = false;
        });

        // for future builder ----------------------
        /*setState(() {
        _taskListFuture = _taskService.fetchTasks(token);
      });*/
      } else {
        setState(() {
          _errorMessage = 'No token found';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

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
    final theme = context.theme;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Simple Todo',
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _errorMessage != null
              ? Center(
                  child: Text('Error: $_errorMessage'),
                )
              : _taskList.isEmpty
                  ? const Center(
                      child: Text('No Tasks Available'),
                    )
                  : ListView.builder(
                      itemCount: _taskList.length,
                      itemBuilder: (BuildContext context, index) {
                        TaskData task = _taskList[index];
                        return TodoList(
                          taskName: task.title ?? "NO Title",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddTaskScreen(
                                  taskData: task,
                                ),
                              ),
                            );
                          },
                          deleteFunction: (contex) => deleteTask(index),
                        );
                      },
                    ),

      // use future builder ----------------------

      /*FutureBuilder<TaskListResponse>(
        future: _taskListFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.data!.isEmpty) {
            return const Center(child: Text('No tasks available'));
          } else {
            List<TaskData> tasks = snapshot.data!.data!;
            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (BuildContext context, index) {
                TaskData task = tasks[index];
                return TodoList(
                  taskName: task.title ?? "NO Title",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddTaskScreen(
                          taskData: task,
                        ),
                      ),
                    );
                  },
                  deleteFunction: (contex) => deleteTask(index),
                );
              },
            );
          }
        },
      ),*/
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTaskScreen(),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: theme.colorScheme.onPrimary,
        ),
      ),
    );
  }
}
