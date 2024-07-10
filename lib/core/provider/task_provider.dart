import 'package:flutter/material.dart';
import 'package:taskmanagment/core/service/task_service.dart';
import 'package:taskmanagment/core/model/task_list.dart';
import 'package:taskmanagment/core/model/create_task.dart';

class TaskProvider with ChangeNotifier {
  final TaskService _taskService = TaskService();
  List<TaskData> _taskList = [];
  List<TaskData> get taskList => _taskList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loadTasks(String token) async {
    _isLoading = true;
    notifyListeners();

    try {
      TaskListResponse listResponse = await _taskService.fetchTasks(token);
      _taskList = listResponse.data ?? [];
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addTask(CreateTaskModel task, String token) async {
    try {
      await _taskService.createTask(task, token);
      await loadTasks(token);
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteTask(String taskId, String token) async {
    try {
      await _taskService.deleteTask(taskId, token);
      await loadTasks(token);
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateTask(String taskId, String token) async {
    try {
      await _taskService.updateTask(taskId, token);
      await loadTasks(token);
    } catch (e) {
      print(e);
    }
  }
}
