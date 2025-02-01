import 'package:flutter/material.dart';
import 'package:medicalapp/services/database_service.dart';
import '../models/user.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              label: 'Username',
              controller: _usernameController,
            ),
            SizedBox(height: 10),
            CustomTextField(
              label: 'Password',
              obscureText: true,
              controller: _passwordController,
            ),
            SizedBox(height: 20),
            CustomButton(
              text: "Sign Up",
              onPressed: () async {
                if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill all fields')));
                  return;
                }
                final user = User(
                  username: _usernameController.text,
                  password: _passwordController.text,
                );
                await DatabaseService().insertUser(user);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue[50], // Light blue background
    );
  }
}