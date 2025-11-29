import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:slf/model/homescreen/homescreen_model.dart';

class LoanService {
  Future<LoanDashboardModel?> getDashboardData(String token) async {
    try {
      final url = Uri.parse(
        "https://slfuatbackend.1on1screen.com/Master/doc/get-customer-loans?customerId=1",
      );

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
