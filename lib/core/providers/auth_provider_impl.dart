import 'package:taskmanagment/core/model/login.dart';
import 'package:taskmanagment/core/providers/auth_provider.dart';
import 'package:taskmanagment/utils/enums/status.dart';
import 'package:taskmanagment/utils/sharePref/share_pref.dart';

import '../service/login.dart';

class AuthProviderImpl extends AuthProvider {
  // Private members for handling login service and shared preferences.

  // A service for managing login operations.
  final LoginService _loginService;

  // A utility for handling shared preferences.
  final SharePref _sharePref;

  // Stores the current login data.
  Login? _login;

  // Tracks whether a login operation is in progress.
  bool _isLoading = false;

  // Tracks the current authentication status.
  Status _status = Status.NotLoggedIn;

  // Constructor to initialize AuthProviderImpl with required services.
  AuthProviderImpl(this._loginService, this._sharePref);

  @override
  // Getter to check if a login operation is currently in progress.
  bool get isLoading => _isLoading;

  @override
  // Asynchronous method to handle the login process.
  // It takes email and password as parameters.
  Future<void> login(String email, String password) async {
    // Set loading state to true and status to Authentication.
    _isLoading = true;
    _status = Status.Authentication;
    notifyListeners();

    try {
      // Perform the login operation using the login service.
      final result = await _loginService.login(email, password);

      // Check if the login was successful (result and token are not null).
      if (result != null && result.token != null) {
        // Update the login data and status.
        _login = result;
        _status = Status.LoggedIn;

        // Save the token to shared preferences.
        await _sharePref.saveToken(result.token!);
      } else {
        // If login failed, update the status to NotLoggedIn.
        _status = Status.NotLoggedIn;
      }
    } catch (e) {
      // Handle any errors during the login process.
      _status = Status.NotLoggedIn;
      print(e); // Print the error for debugging.
    }

    // Set loading state to false and notify listeners about the state change.
    _isLoading = false;
    notifyListeners();
  }

  @override
  // Getter to return the current login data.
  Login? get loginData => _login;

  @override
  // Getter to return the current authentication status.
  Status get status => _status;
}
