import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:search_restaurants/app.dart';
import 'package:search_restaurants/di/dependency_injection.dart';
import 'package:search_restaurants/firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(Environment.dev);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
