class AppUrl {

  static const String baseURL = "https://task.teamrabbil.com/api/v1";
  static const String login = "$baseURL/login";
  static const String register = "$baseURL/registration";
  static const String forgotPassword = "$baseURL/forgot-password";
  static const String taskList = "$baseURL/listTaskByStatus/New";
  static String deleteTask(String taskId) => "$baseURL/deleteTask/$taskId";
  static const String addTask = "$baseURL/createTask";
  //static const String updateTask = "$baseURL/updateTaskStatus/62b7582fac0007cc76c29b53/New";
  static String updateTask(String taskId)=>"$baseURL/updateTaskStatus/$taskId/New";
}
