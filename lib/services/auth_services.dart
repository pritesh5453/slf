import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:slf/model/login/login_model.dart';
import 'package:slf/model/menuModel.dart';
import 'package:slf/utils/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<LoginResponse?> loginUser(String email, String password) async {
    try {
      final url = Uri.parse(
        "https://slfuatbackend.1on1screen.com/Master/doc/login",
      );

      final body = {"email": email, "password": password};

      print("📤 Sending Login Request...");
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      print("📥 Response: ${response.body}");

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        // Convert API response
        final loginResponse = LoginResponse.fromJson(jsonData);

        // ---------------------------
        // 🔥 Set Global Variables
        // ---------------------------
        if (jsonData["customer"] != null) {
          menuUser = MenuCustomer.fromJson(jsonData["customer"]);
          accessToken = jsonData["accessToken"];
        }

        // ---------------------------
        // 🔥 Save in SharedPreferences
        // ---------------------------
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("accessToken", accessToken!);
        await prefs.setString("userData", jsonEncode(jsonData["customer"]));

        print("✅ Login data saved in SharedPreferences");

        return loginResponse;
      } else {
        print("❌ API Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("❌ Exception in loginUser(): $e");
      return null;
    }
  }
}
