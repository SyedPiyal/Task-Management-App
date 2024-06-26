import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../utils/constans/app_url.dart';
import '../model/task_list.dart';

class TaskService {

  Future<TaskListResponse> fetchTasks(String token) async {
    final response = await http.get(
      Uri.parse(AppUrl.taskList),
      headers: {
        'Content-Type': 'application/json',
        'Accept':'application/json',
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
}