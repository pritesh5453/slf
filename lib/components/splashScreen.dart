import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slf/Auth/loginScreen.dart';
import 'package:slf/utils/global.dart';
import 'package:slf/model/menuModel.dart';
import 'package:slf/widgets/navbar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();

    /// Animation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    _scaleAnim = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    /// After animation → checkLogin()
    Timer(const Duration(seconds: 2), () {
      checkLogin();
    });
  }

  Future<void> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final token = prefs.getString("accessToken");
    final userJson = prefs.getString("userData");

    if (token == null || userJson == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
      return;
    }

    accessToken = token;
    menuUser = MenuCustomer.fromJson(jsonDecode(userJson));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const MainHomeScreen()),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF082766),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// LOGO WITH ANIMATION
            ScaleTransition(
              scale: _scaleAnim,
              child: Image.asset("assets/images/logo.png", height: h * 0.18),
            ),

            SizedBox(height: h * 0.03),

            /// APP TITLE
            const Text(
              "SLF Gold Loan",
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: h * 0.005),

            /// TAGLINE
            const Text(
              "Secure. Simple. Swift",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),

            SizedBox(height: h * 0.05),

            /// PROGRESS INDICATOR — EXACT STYLE
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.15),
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: LinearProgressIndicator(
                      value: _controller.value,
                      minHeight: 6,
                      backgroundColor: Colors.white,
                      color: Colors.yellow,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
