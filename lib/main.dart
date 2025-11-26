import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // <-- IMPORTANT
import 'package:slf/Auth/loginScreen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp())); // <-- WRAPPED HERE
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
