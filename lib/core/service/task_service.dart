import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../utils/constans/app_url.dart';
import '../model/create_task.dart';
import '../model/create_task_response.dart';
import '../model/delete_task.dart';
import '../model/task_list.dart';
import '../model/update_task.dart';

class TaskService {
  Future<TaskListResponse> fetchTasks(String token) async {
    final response = await http.get(
      Uri.parse(AppUrl.taskList),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'token': token,
      },
    );

    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      return TaskListResponse.fromJson(responseBody);
    } else {
      print('Failed: ${response.body}');
      throw Exception('Failed to load tasks');
    }
  }

  //--------------> add task <--------------//
  Future<CreateTaskResponse> createTask(CreateTaskModel task,
      String token) async {
    final response = await http.post(
      Uri.parse(AppUrl.addTask),
      headers: {
        'token': token,
        'Content-Type': 'application/json',
      },
      body: jsonEncode(task.toJson()),
    );

    if (response.statusCode == 200) {
      return CreateTaskResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create task');
    }
  }

  //------------------------------
  // Delete Task
  //------------------------------

  Future<DeleteTaskResponse> deleteTask(String taskId, String token) async {
    final response = await http.get(
      Uri.parse(AppUrl.deleteTask(taskId)),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'token': token,
      },
    );

    if (response.statusCode == 200) {
      return DeleteTaskResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to delete task');
    }
  }


  //------------------------------
  // Update Task
  //------------------------------

  Future<UpdateTask> updateTask(String taskId, String token) async {
    final response = await http.get(
      Uri.parse(AppUrl.updateTask(taskId),),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'token': token,
      },
    );
    if(response.statusCode == 200){
      return UpdateTask.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Failed to Update task');
    }
  }
}
