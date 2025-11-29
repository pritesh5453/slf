class PaymentDetails {
  final String bank;
  final String paidBy;
  final String utrNumber;
  final String customerBank;
  final String customerAmount;

  PaymentDetails({
    required this.bank,
    required this.paidBy,
    required this.utrNumber,
    required this.customerBank,
    required this.customerAmount,
  });

  factory PaymentDetails.fromJson(Map<String, dynamic> json) {
    return PaymentDetails(
      bank: json["bank"] ?? "",
      paidBy: json["paidBy"] ?? "",
      utrNumber: json["utrNumber"] ?? "",
      customerBank: json["customerBank"] ?? "",
      customerAmount: json["customerAmount"] ?? "",
    );
  }
}
