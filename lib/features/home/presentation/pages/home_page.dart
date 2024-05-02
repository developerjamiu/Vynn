import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routePath = '/';
  static const routeName = 'Home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
