import 'package:slf/model/login/customer_model.dart';

class LoginResponse {
  final bool status;
  final String message;
  final String accessToken;
  final Customer customer;

  LoginResponse({
    required this.status,
    required this.message,
    required this.accessToken,
    required this.customer,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json["status"] ?? false,
      message: json["message"] ?? "",
      accessToken: json["accessToken"] ?? "",
      customer: Customer.fromJson(json["customer"] ?? {}),
    );
  }
}
