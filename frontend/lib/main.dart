import 'package:flutter/material.dart';
import 'package:frontend/features/auth/login_page.dart';
import 'features/auth/pages/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task app',
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
            contentPadding: const EdgeInsets.all(20),
            border: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade400)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400))),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)))),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
