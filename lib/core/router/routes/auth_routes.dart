import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final authRoutes = [
  GoRoute(
    path: '/auth-options',
    name: 'AuthOptions',
    builder: (context, state) => const Scaffold(), // AuthOptionsPage
    routes: [
      GoRoute(
        path: 'sign_in',
        name: 'SignIn',
        builder: (context, state) => const Scaffold(), // SignInPage
      ),
      GoRoute(
        path: 'sign_up',
        name: 'SignUp',
        builder: (context, state) => const Scaffold(), // SignUpPage
      ),
    ],
  ),
];
