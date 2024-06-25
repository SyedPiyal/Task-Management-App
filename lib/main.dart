import 'package:flutter/material.dart';
import 'package:taskmanagment/utils/theme/theme.dart';

import 'core/view/auth/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeDataConfig.lightTheme,
      darkTheme: ThemeDataConfig.darkTheme,
      home: const LoginView(),
    );
  }
}
