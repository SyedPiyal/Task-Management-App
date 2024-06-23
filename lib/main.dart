import 'package:flutter/material.dart';
import 'package:taskmanagment/utils/theme/theme.dart';

import 'core/view/auth/auth_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      /*theme: ThemeDataConfig.lightTheme,
      darkTheme: ThemeDataConfig.darkTheme,*/
      home: AuthView(),
    );
  }
}
