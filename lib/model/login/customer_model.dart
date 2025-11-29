class Customer {
  final int id;
  final String email;
  final String mobile;
  final String firstName;
  final String lastName;

  Customer({
    required this.id,
    required this.email,
    required this.mobile,
    required this.firstName,
    required this.lastName,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json["id"] ?? 0,
      email: json["email"] ?? "",
      mobile: json["mobile"] ?? "",
      firstName: json["firstName"] ?? "",
      lastName: json["lastName"] ?? "",
    );
  }
}
