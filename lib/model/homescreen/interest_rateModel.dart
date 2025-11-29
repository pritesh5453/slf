class InterestRate {
  final String term;
  final double rate;

  InterestRate({required this.term, required this.rate});

  factory InterestRate.fromJson(Map<String, dynamic> json) {
    return InterestRate(
      term: json["term"],
      rate: (json["rate"] as num).toDouble(),
    );
  }
}
