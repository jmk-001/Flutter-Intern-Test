import 'package:flutter/material.dart';
import 'theme.dart';
import 'pages/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: appTheme,
      home: LoginScreen(),
    );
  }
}
