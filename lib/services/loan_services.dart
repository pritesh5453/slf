import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:slf/model/activeloans.dart';
import 'package:slf/utils/global.dart';

class LoanService {
  // ⭐ Fetch Active Loans with Dynamic customerId
  Future<ActiveLoansResponse?> fetchActiveLoans() async {
    try {
      // 🔥 Dynamic customerId from logged-in user
      final customerId = menuUser?.id;

      if (customerId == null) {
        print("❌ ERROR: menuUser.id is NULL — user not logged in!");
        return null;
      }

      final url = Uri.parse(
        "https://slfuatbackend.1on1screen.com/Master/doc/customer-Active-Loans?customerId=$customerId",
      );

      print("📤 Calling Active Loans API for Customer ID: $customerId");

      final response = await http.get(url);

      print("📥 Active Loans API Status: ${response.statusCode}");
      print("📥 Response: ${response.body}");

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return ActiveLoansResponse.fromJson(jsonData);
      } else {
        print("❌ API Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("❌ Exception in Active Loans API: $e");
      return null;
    }
  }
}
