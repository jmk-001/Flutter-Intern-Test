import 'package:flutter/material.dart';
import 'package:flutter_intern_test/pages/login_screen.dart';
import 'package:provider/provider.dart';
import 'models/medication_manager.dart';

void main() {
  runApp(
    // Open scope for MedicationManager's context
    ChangeNotifierProvider(
      create: (context) => MedicationManager(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medication App',
      home: LoginScreen(),
    );
  }
}
