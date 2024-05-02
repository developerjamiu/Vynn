import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  static const routePath = 'sign_up';
  static const routeName = 'SignUp';

  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text('Sign Up'),
            ],
          ),
        ),
      ),
    );
  }
}
