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

  Future<void> signUp(SignupModel signupModel) async {
    _setLoading(true);
    try {
      await _authService.signUpService(signupModel);
      _setLoading(false);
    } catch (e) {
      _setErrorMessage(e.toString());
    }
  }

  Future<void> login(Login loginData) async {
    _setLoading(true);
    try {
      await _authService.loginService(loginData);
      _setLoading(false);
    } catch (e) {
      _setErrorMessage(e.toString());
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
