import 'package:flutter/material.dart';
import 'package:slf/services/auth_services.dart';
import 'package:slf/widgets/navbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  void doLogin() async {
    print("------------- LOGIN REQUEST -------------");
    print("➡ email: ${usernameController.text.trim()}");
    print("➡ Password: ${passwordController.text.trim()}");

    setState(() => isLoading = true);

    AuthService auth = AuthService();

    try {
      final res = await auth.loginUser(
        usernameController.text.trim(),
        passwordController.text.trim(),
      );

      setState(() => isLoading = false);

      print("------------- LOGIN RESPONSE -------------");

      if (res != null && res.status == true) {
        print("✅ SUCCESS: Login Successful");
        print("🔑 Access Token: ${res.accessToken}");
        print("👤 User Email: ${res.customer.email}");
        print("👤 User Mobile: ${res.customer.mobile}");

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MainHomeScreen()),
        );
      } else {
        print("❌ FAILURE: Login Failed");
        print("Server Message: ${res?.message ?? 'No server message'}");

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(res?.message ?? "Login Failed")));
      }
    } catch (e) {
      setState(() => isLoading = false);

      print("❌ EXCEPTION OCCURRED");
      print("Error: $e");

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Something went wrong")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF022A7C),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),

                // ------------ LOGO ------------
                Container(
                  height: 90,
                  width: 90,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/logo.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                const Text(
                  "SLF Gold Loan",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Secure. Simple. Swift",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),

                const SizedBox(height: 30),

                // ------------ LOGIN CARD ------------
                Container(
                  width: width * 0.88,
                  padding: const EdgeInsets.symmetric(
                    vertical: 22,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 12,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Mobile No / Customer ID
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xfff3f4f6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: usernameController,
                          decoration: const InputDecoration(
                            labelText: "Email No / Customer ID",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 14,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      // PASSWORD
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xfff3f4f6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: "Password",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 14,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      // LOGIN BUTTON
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF4B400),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: isLoading ? null : doLogin,
                          child: isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.black,
                                )
                              : const Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ),
                      ),

                      const SizedBox(height: 15),

                      const Text(
                        "New customer? Visit our nearest branch",
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  "For assistance, call: +91 8965911445",
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
