import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final homeRoutes = [
  GoRoute(
    path: '/',
    name: 'Home',
    builder: (context, state) => const Scaffold(), // HomePage
  ),
];
