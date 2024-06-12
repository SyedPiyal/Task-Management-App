import 'package:flutter/material.dart';
//TextForm Feild style
InputDecoration textFeildStyle(String hintText) {
  return InputDecoration(
      hintText: hintText,
      fillColor: Colors.white,
      filled: true,
      focusedBorder: OutlineInputBorder(),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
      ));
}