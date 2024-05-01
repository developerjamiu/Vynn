import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vynn/firebase_options.dart';
import 'package:vynn/vynn_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const VynnApp());
}
