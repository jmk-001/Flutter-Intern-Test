import 'package:flutter/material.dart';
import 'package:flutter_intern_test/pages/login_screen.dart';
import 'package:flutter_intern_test/theme.dart';
import 'package:provider/provider.dart';
import 'models/medication_manager.dart';

void main() {
  runApp(
    // Opens scope for MedicationManager's context
    ChangeNotifierProvider(
      create: (context) => MedicationManager(),
      child: const MyApp(),
    ),
  );
}

/// Root widget: loads the initial screen (LoadingScreen)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medication App',
      home: const LoginScreen(),
      theme: appTheme,
    );
  }
}
