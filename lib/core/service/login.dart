
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:taskmanagment/utils/constans/app_url.dart';
import '../model/login.dart';

class LoginService{

  // Method to handle the login process.
  // It takes email and password as parameters.
  // Returns a Future that resolves to a Login object or null if the login fails.

  Future<Login?> login(String email, String password) async {

    // Make a POST request to the login endpoint.
    // Uri.parse converts the URL string to a URI object.

    final response = await http.post(
      // The login URL.
      Uri.parse(AppUrl.login),

      // Set the request headers.
      headers: {'Content-Type': 'application/json'},

      // Convert the email and password to a JSON string.
      body: jsonEncode({'email':email,'password':password}),
    );

    // Check if the response status code indicates success (200 OK).
    if(response.statusCode==200){

      // Parse the response body into a Map using jsonDecode.
      final data = jsonDecode(response.body);

      // Create and return a Login object from the parsed data.
      // The fromJson constructor of Login converts the Map to a Login instance.
      return Login.fromJson(data);
    }else{
      // If the response status code is not 200, throw an exception.
      // This indicates that the login attempt failed.
      throw Exception("Failed to login");
    }
  }

}