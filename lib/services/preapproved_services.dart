import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:slf/model/PreApprovedLoanmodel.dart';
import 'package:slf/utils/global.dart';

class PreApprovedLoanService {
  // ⭐ Fetch Pre-Approved Loans with Dynamic customerId
  static Future<PreApprovedLoanResponse?> getPreApprovedLoans() async {
    try {
      // 🔥 Dynamic customerId from logged-in user
      final customerId = menuUser?.id;

      if (customerId == null) {
        print("❌ ERROR: menuUser.id is NULL — user not logged in!");
        return null;
      }

      // 👉 Build API URL
      final url = Uri.parse(
        "https://slfuatbackend.1on1screen.com/Master/doc/customer-Pre_Approved-Loans?customerId=$customerId",
      );

      print("📤 Calling Pre-Approved Loans API for Customer ID: $customerId");

      // 👉 Hit API
      final response = await http.get(url);

      print("📥 Pre-Approved Loans API Status: ${response.statusCode}");
      print("📥 Response: ${response.body}");

      // 👉 Success
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        print("📦 Decoded JSON: $jsonData");

        return PreApprovedLoanResponse.fromJson(jsonData);
      } else {
        print("❌ API Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("❌ Exception in Pre-Approved Loans API: $e");
      return null;
    }
  }
}
