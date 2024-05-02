import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final initializationRoutes = [
  GoRoute(
    path: '/initialization',
    name: 'Initialization',
    builder: (context, state) => const Scaffold(), // InitializationPage
  ),
];
