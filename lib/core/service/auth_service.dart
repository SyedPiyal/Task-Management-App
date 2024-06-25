import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskmanagment/core/model/sign_up.dart';
import '../../utils/constans/app_url.dart';
import '../model/login.dart';
import '../model/login_response.dart';

class AuthService {
  //--------------> method for sign up user <--------------//
  Future<void> signUpService(SignUpModel signUpModel) async {
    final response = await http.post(
      Uri.parse(AppUrl.register),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(signUpModel.toJson()),
    );
    if (response.statusCode == 200) {
      print("SuccessFull");
    } else {
      print('failed to register:${response.body}');
    }
  }

  //--------------> Method for login user <--------------//

  Future<UserData> loginService(Login login) async {
    final response = await http.post(
      Uri.parse(AppUrl.login),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(login.toJson()),
    );
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      UserData userData = UserData.fromJson(responseBody);
      await _saveToken(userData.token ?? "");
      return userData;
    } else {
      print('Failed:${response.body}');
      throw Exception("Failded To Login");
    }
  }

  //--------------> method for saving and getting token <--------------//

  Future<void> _saveToken(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('auth_token', token);
  }

  Future<String?> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('auth_token');
  }
}
