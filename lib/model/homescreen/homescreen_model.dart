import 'package:slf/model/homescreen/loandata_model.dart';

class LoanDashboardModel {
  final bool status;
  final int statusCode;
  final String message;
  final List<LoanData> activeLoans;
  final double totalOutstanding; // 🔥 int → double
  final int activeLoansCount;

  LoanDashboardModel({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.activeLoans,
    required this.totalOutstanding,
    required this.activeLoansCount,
  });

  factory LoanDashboardModel.fromJson(Map<String, dynamic> json) {
    return LoanDashboardModel(
      status: json["status"] ?? false,
      statusCode: json["statusCode"] ?? 0,
      message: json["message"] ?? "",

      activeLoans:
          (json["ActiveLoans"] as List?)
              ?.map((e) => LoanData.fromJson(e))
              .toList() ??
          [],

      // 🔥 API returns: "57584.00" (string)
      totalOutstanding:
          double.tryParse(json["TotalOutstanding"].toString()) ?? 0.0,

      activeLoansCount: int.tryParse(json["ActiveLoansCount"].toString()) ?? 0,
    );
  }
}
