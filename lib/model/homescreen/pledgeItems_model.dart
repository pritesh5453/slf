class PledgeItem {
  final int id;
  final String particular;
  final int nos;
  final double gross;
  final double netWeight;
  final String purity;
  final String calculatedPurity;
  final double rate;
  final double valuation;
  final String remark;

  PledgeItem({
    required this.id,
    required this.particular,
    required this.nos,
    required this.gross,
    required this.netWeight,
    required this.purity,
    required this.calculatedPurity,
    required this.rate,
    required this.valuation,
    required this.remark,
  });

  factory PledgeItem.fromJson(Map<String, dynamic> json) {
    return PledgeItem(
      id: json["id"] ?? 0,
      particular: json["particular"] ?? "",
      nos: int.tryParse(json["nos"].toString()) ?? 0,
      gross: double.tryParse(json["gross"].toString()) ?? 0.0,
      netWeight: double.tryParse(json["netWeight"].toString()) ?? 0.0,
      purity: json["purity"] ?? "",
      calculatedPurity: json["Calculated_Purity"] ?? "",
      rate: double.tryParse(json["rate"].toString()) ?? 0.0,
      valuation: double.tryParse(json["valuation"].toString()) ?? 0.0,
      remark: json["remark"] ?? "",
    );
  }
}
