import 'package:flutter/material.dart';
import 'home_page.dart';

/// This class provides a Login screen that is used to validate the user identity.
///
/// As of now, only isEmpty validation is included.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // Submit login form and move to HomePage
  void _login() {
    if (_formKey.currentState!.validate()) {
      String username = _usernameController.text;
      String password = _passwordController.text;

      // -------------------------------
      // FUTURE VALIDATION LOGIC HERE
      // E.G. FETCH DB FOR USER IDENTITY
      // -------------------------------

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Welcome, $username')),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              // Username input field
              TextFormField(
                controller: _usernameController,
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "Username must not be empty";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
              ),

              // Password input field
              TextFormField(
                controller: _passwordController,
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "Password must not be empty";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 30),
              Row(children: [
                ElevatedButton(
                  onPressed: _login,
                  child: const Text('Login'),
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
