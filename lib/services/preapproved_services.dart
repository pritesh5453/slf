import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:slf/model/PreApprovedLoanmodel.dart';

class PreApprovedLoanService {
  static const String baseUrl =
      "https://slfuatbackend.1on1screen.com/Master/doc/customer-Pre_Approved-Loans?customerId=1"; // apna base URL

  /// 🔥 Fetch Pre-Approved Loans by Borrower ID
  static Future<PreApprovedLoanResponse?> getPreApprovedLoans(
    int borrowerId,
  ) async {
    try {
      final url = Uri.parse("$baseUrl/loan/preApproved/$borrowerId");

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        return PreApprovedLoanResponse.fromJson(jsonData);
      } else {
        print("❌ API Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("❌ Exception in getPreApprovedLoans: $e");
      return null;
    }
  }
}
