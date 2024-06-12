import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:taskmanagment/core/model/login.dart';
import 'package:taskmanagment/utils/constans/app_url.dart';
import 'package:taskmanagment/utils/enums/status.dart';

import '../model/sign_up.dart';

class AuthProvider with ChangeNotifier {
  // enum assign in variable ----------------------

   Status _loggedInStatus = Status.NotLoggedIn;
   Status _registeredInStatus = Status.NotRegistered;

  // getter  ----------------------

  Status get loggedInStatus => _loggedInStatus;

  Status get registeredInStatus => _registeredInStatus;

// setter ----------------------

  Future<Map<String, dynamic>> login(String email, String password) async {
    var result;

    final Map<String,dynamic> loginData = {
        "email":email,
        "password":password

    };

    _loggedInStatus = Status.Authentication;
    notifyListeners();

    Response response = await post(
      Uri(path: AppUrl.login,),
      body: jsonEncode(loginData),
      headers: {'Content-Type':'application/json'}
    );

    if(response.statusCode == 200){
      final Map<String,dynamic> responseData = jsonDecode(response.body);
      var userData = responseData['data'];

      Login login = Login.fromJson(userData);


    }

  }
}
