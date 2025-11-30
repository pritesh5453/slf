import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:slf/model/homescreen/homescreen_model.dart';
import 'package:slf/utils/global.dart';

class LoanService {
  Future<LoanDashboardModel?> getDashboardData(String token) async {
    try {
      // 🔥 Dynamic customerId from logged-in user
      final customerId = menuUser?.id;

      if (customerId == null) {
        print("❌ ERROR: menuUser.id is NULL, user not logged in!");
        return null;
      }

      final url = Uri.parse(
        "https://slfuatbackend.1on1screen.com/Master/doc/get-customer-loans?customerId=$customerId",
      );

      print("📤 Calling Dashboard API for Customer ID: $customerId");

      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      print("📥 Dashboard API Status: ${response.statusCode}");
      print("📥 Response: ${response.body}");

      if (response.statusCode == 200) {
        return LoanDashboardModel.fromJson(json.decode(response.body));
      } else {
        print("❌ Error fetching dashboard: ${response.body}");
        return null;
      }
    } catch (e) {
      print("❌ Exception in Dashboard API: $e");
      return null;
    }
  }
}
