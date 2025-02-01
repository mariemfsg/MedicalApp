import 'package:flutter/material.dart';
import 'package:medicalapp/screens/signup_screen.dart';
import 'package:medicalapp/services/database_service.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
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
              text: "Login",
              onPressed: () async {
                if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill all fields')));
                  return;
                }
                final user = await DatabaseService().getUser(_usernameController.text);
                if (user != null && user.password == _passwordController.text) {
                  Navigator.pushReplacementNamed(context, '/home');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Invalid credentials')),
                  );
                }
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
              },
              child: Text("Don't have an account? Sign up"),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue[50], // Light blue background
    );
  }
}