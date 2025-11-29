import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:slf/model/menuModel.dart';
import 'package:slf/utils/global.dart';

class MenuService {
  static const String baseUrl =
      "https://slfuatbackend.1on1screen.com/Master/doc/login";

  /// 🔥 Fetch customer profile for Drawer/Menu
  static Future<MenuModel?> getCustomerDetails(int customerId) async {
    try {
      final url = Uri.parse("$baseUrl/customer/$customerId");

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        final model = MenuModel.fromJson(jsonData);

        // Store globally for Drawer
        menuUser = model.customer;

        print("Menu User Loaded: ${menuUser?.firstName}");

        return model;
      } else {
        print("❌ Menu API Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("❌ Menu Exception: $e");
      return null;
    }
  }
}
