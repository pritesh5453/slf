import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slf/utils/global.dart';

Future<void> logoutUser(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();

  // 🧹 1) Clear local storage (tokens, user data)
  await prefs.clear();

  // ❌ 2) Clear global variables also
  menuUser = null;
  accessToken = null;

  print("✅ User logged out, sharedpref cleared!");

  // 🚪 3) Navigate user to Login Screen
  Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
}
