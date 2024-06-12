import 'package:flutter/cupertino.dart';
import 'package:taskmanagment/core/model/login.dart';
import 'package:taskmanagment/utils/enums/status.dart';

abstract class AuthProvider with ChangeNotifier {
  // Abstract method for logging in a user.
  // This method must be implemented by any concrete subclass.
  // It takes an email and a password as parameters.
  Future<void> login(String email, String password);

  // Abstract getter for obtaining the login data.
  // This would return an instance of the `Login` model, which contains user login information.
  // Subclasses must provide a concrete implementation to return login data.
  Login? get loginData;

  // Abstract getter that indicates whether a login operation is currently in progress.
  // This is typically used to manage loading states in the UI.
  bool get isLoading;

  // Abstract getter for the current status.
  // The `Status` enum would define various states, such as `authenticated`, `unauthenticated`, `loading`, etc.
  Status get status;
}
