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

  void _deleteTask(String taskId) async {
    try {
      String? token = await _authService.getToken();
      if (token != null) {
        var deleteResponse = await _taskService.deleteTask(taskId, token);
        if (deleteResponse.status == 'success') {
          setState(() {
            _taskList.removeWhere((task) => task.id == taskId);
          });
        } else {
          _showErrorSnackbar('Failed to delete task');
        }
      } else {
        _showErrorSnackbar('No token found');
      }
    } catch (e) {
      _showErrorSnackbar('Error: $e');
    }
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
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
                          deleteFunction: (contex) => _deleteTask(task.id!),
                        );
                      },
                    ),


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
