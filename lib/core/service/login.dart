
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:taskmanagment/utils/constans/app_url.dart';
import '../model/login.dart';

class LoginService{

  Future<Login?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse(AppUrl.login),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email':email,'password':password}),
    );

    if(response.statusCode==200){
      final data = jsonDecode(response.body);
      return Login.fromJson(data);
    }else{
      throw Exception("Failed to login");
    }
  }

}