import 'package:flutter/material.dart';
import 'package:taskmanagment/core/model/login.dart';
import 'package:taskmanagment/core/model/signup.dart';
import 'package:taskmanagment/core/service/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<bool> signUp(SignupModel signupModel) async {
    _setLoading(true);
    try {
      await _authService.signUpService(signupModel);
      _setLoading(false);
      return true;
    } catch (e) {
      _setErrorMessage(e.toString());
      return false;
    }
  }

  Future<bool> login(Login loginData) async {
    _setLoading(true);
    try {
      await _authService.loginService(loginData);
      _setLoading(false);
      return true;
    } catch (e) {
      _setErrorMessage(e.toString());
      return false;
    }
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setErrorMessage(String message) {
    _errorMessage = message;
    _setLoading(false);
  }
}
