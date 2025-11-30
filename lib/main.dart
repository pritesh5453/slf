import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:slf/Auth/loginScreen.dart';
import 'package:slf/components/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // GLOBAL STATUS BAR SETUP
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // White background
      statusBarIconBrightness: Brightness.light, // White icons
      statusBarBrightness: Brightness.dark, // Dark status bar (for iOS)
    ),
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: SplashScreen(),
      routes: {'/login': (_) => const LoginScreen()},
    );
  }
}
