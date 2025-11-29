// ------------------------------
// SAFE NUMBER PARSER
// ------------------------------
num parseNum(dynamic value) {
  if (value == null) return 0;

  if (value is num) return value;

  if (value is String) return num.tryParse(value) ?? 0;

  return 0;
}

// =====================================================
//  ACTIVE LOANS RESPONSE MODEL
// =====================================================
class ActiveLoansResponse {
  final bool status;
  final String message;
  final List<LoanModel> activeLoans;
  final List<LoanModel> bulletLoans;
  final List<LoanModel> emiLoans;
  final num totalOutstanding;

  ActiveLoansResponse({
    required this.status,
    required this.message,
    required this.activeLoans,
    required this.bulletLoans,
    required this.emiLoans,
    required this.totalOutstanding,
  });

  factory ActiveLoansResponse.fromJson(Map<String, dynamic> json) {
    return ActiveLoansResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? "",

      activeLoans: (json['ActiveLoans'] as List? ?? [])
          .map((e) => LoanModel.fromJson(e))
          .toList(),

      bulletLoans: (json['BulletLoans'] as List? ?? [])
          .map((e) => LoanModel.fromJson(e))
          .toList(),

      emiLoans: (json['EMILoans'] as List? ?? [])
          .map((e) => LoanModel.fromJson(e))
          .toList(),

      totalOutstanding: parseNum(json['TotalOutstanding']),
    );
  }
}

// =====================================================
//  PLEDGE ITEM MODEL  (USED BY BOTH SCREENS)
// =====================================================
class PledgeItem {
  final int? id;
  final String? particular;
  final num? gross;
  final num? netWeight;
  final String? purity;
  final String? remark;

  PledgeItem({
    this.id,
    this.particular,
    this.gross,
    this.netWeight,
    this.purity,
    this.remark,
  });

  factory PledgeItem.fromJson(Map<String, dynamic> json) {
    return PledgeItem(
      id: json["id"],
      particular: json["particular"] ?? "-",
      gross: parseNum(json["gross"]),
      netWeight: parseNum(json["netWeight"]),
      purity: json["purity"] ?? "-",
      remark: json["remark"] ?? "",
    );
  }
}

// =====================================================
//  LOAN MODEL (FULL API VERSION FOR DETAILS PAGE)
// =====================================================
class LoanModel {
  final int id;
  final String borrower;
  final num netPayable;
  final String approvalDate;
  final num netWeight;
  final num loanAmountPaid;
  final int loanTenure;

  final String ornamentPhoto; // NEW FIELD
  final String remark; // NEW FIELD
  final List<PledgeItem> pledgeItems; // NEW FIELD

  LoanModel({
    required this.id,
    required this.borrower,
    required this.netPayable,
    required this.approvalDate,
    required this.netWeight,
    required this.loanAmountPaid,
    required this.loanTenure,
    required this.ornamentPhoto,
    required this.remark,
    required this.pledgeItems,
  });

  factory LoanModel.fromJson(Map<String, dynamic> json) {
    final pledgeList = (json["Pledge_Item_List"] as List? ?? []);

    return LoanModel(
      id: json['id'] ?? 0,
      borrower: json['Borrower'] ?? "",
      netPayable: parseNum(json['Net_Payable']),
      approvalDate: json['approval_date'] ?? "",

      netWeight: pledgeList.isNotEmpty
          ? parseNum(pledgeList[0]["netWeight"])
          : 0,

      loanAmountPaid: parseNum(json['LoanAmountPaid']),

      loanTenure: json['Loan_Tenure'] is int
          ? json['Loan_Tenure']
          : (json['Loan_Tenure'] is String
                ? int.tryParse(json['Loan_Tenure']) ?? 0
                : 0),

      ornamentPhoto: json["Ornament_Photo"] ?? "",
      remark: json["remark"] ?? "",

      pledgeItems: pledgeList.map((e) => PledgeItem.fromJson(e)).toList(),
    );
  }
}
