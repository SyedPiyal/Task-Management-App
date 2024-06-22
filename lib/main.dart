import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskmanagment/core/service/auth_service.dart';
import 'package:taskmanagment/utils/sharePref/share_pref.dart';
import 'package:taskmanagment/utils/theme/theme.dart';

import 'core/view/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      /*theme: ThemeDataConfig.lightTheme,
      darkTheme: ThemeDataConfig.darkTheme,*/
      home: const LoginScreen(),
    );
  }
}
