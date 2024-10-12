import 'package:flutter/material.dart';
import 'package:flutter_intern_test/pages/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _logout(BuildContext context) {
    // Navigate to Login screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Successfully logged out.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          _logout(context);
        },
        child: const Text('Logout'),
      ),
    );
  }
}
