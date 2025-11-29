import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:slf/model/login/login_model.dart';
import 'package:slf/model/menuModel.dart';
import 'package:slf/utils/global.dart';

class AuthService {
  Future<LoginResponse?> loginUser(String email, String password) async {
    try {
      final url = Uri.parse(
        "https://slfuatbackend.1on1screen.com/Master/doc/login",
      );

      final body = {"email": email, "password": password};

      print("📤 Sending Login Request to API...");
      print("➡ Body: $body");

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      print("📥 Raw Response: ${response.body}");

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        // Convert to LoginResponse model
        final loginResponse = LoginResponse.fromJson(jsonData);

        // -------------------------------------------------------
        // 🔥 MOST IMPORTANT — SET GLOBAL menuUser FOR DRAWER
        // -------------------------------------------------------
        if (jsonData["customer"] != null) {
          menuUser = MenuCustomer.fromJson(jsonData["customer"]);

          print("✅ menuUser SET SUCCESSFULLY");
          print("➡ Name: ${menuUser?.printName}");
          print("➡ Email: ${menuUser?.email}");
          print("➡ Mobile: ${menuUser?.mobile}");
        } else {
          print("⚠️ Login response me 'customer' object missing hai");
        }

        // 🔥 Store token globally too (useful)
        accessToken = jsonData["accessToken"];

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
