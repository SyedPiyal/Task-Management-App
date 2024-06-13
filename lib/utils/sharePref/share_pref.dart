import 'package:shared_preferences/shared_preferences.dart';

class SharePref {
  // Method to save a token to shared preferences.
  // This method is asynchronous because it performs IO operations.
  Future<void> saveToken(String token) async {
    // Get an instance of SharedPreferences.
    final prefs = await SharedPreferences.getInstance();

    // Save the token under the key 'token'.
    // This persists the token in the local storage of the device.
    await prefs.setString('token', token);
  }

  // Method to retrieve the token from shared preferences.
  // It returns a Future that completes with the token or null if the token doesn't exist.
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();

    // Retrieve the token stored under the key 'token'.
    // If the token doesn't exist, this will return null.
    return prefs.getString('token');
  }

  // Method to remove the token from shared preferences.
  // This method is asynchronous because it performs IO operations.
  Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();

    // Remove the token stored under the key 'token'.
    // This deletes the token from the local storage.
    await prefs.remove('token');
  }
}
