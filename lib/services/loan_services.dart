import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:slf/model/activeloans.dart';

class LoanService {
  static const String activeLoansUrl =
      "https://slfuatbackend.1on1screen.com/Master/doc/customer-Active-Loans?customerId=1";

  // ⭐ THIS IS THE METHOD YOU NEED
  Future<ActiveLoansResponse?> fetchActiveLoans() async {
    try {
      final response = await http.get(Uri.parse(activeLoansUrl));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return ActiveLoansResponse.fromJson(jsonData);
      } else {
        print("❌ API Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("❌ Exception: $e");
      return null;
    }
  }
}
