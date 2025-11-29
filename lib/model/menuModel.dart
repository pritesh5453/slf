class MenuModel {
  final bool status;
  final String message;
  final String accessToken;
  final MenuCustomer customer;

  MenuModel({
    required this.status,
    required this.message,
    required this.accessToken,
    required this.customer,
  });

  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(
      status: json['status'],
      message: json['message'],
      accessToken: json['accessToken'],
      customer: MenuCustomer.fromJson(json['customer']),
    );
  }
}

class MenuCustomer {
  final int id;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? email;
  final String? mobile;
  final String? altMobile;
  final String? dob;
  final String? gender;
  final String? printName;
  final String? profileImage;

  final String? permanentAddress;
  final String? permanentCity;
  final String? permanentState;
  final String? permanentCountry;

  final String? correspondingAddress;
  final String? correspondingCity;
  final String? correspondingState;
  final String? correspondingCountry;

  MenuCustomer({
    required this.id,
    this.firstName,
    this.middleName,
    this.lastName,
    this.email,
    this.mobile,
    this.altMobile,
    this.dob,
    this.gender,
    this.printName,
    this.profileImage,
    this.permanentAddress,
    this.permanentCity,
    this.permanentState,
    this.permanentCountry,
    this.correspondingAddress,
    this.correspondingCity,
    this.correspondingState,
    this.correspondingCountry,
  });

  factory MenuCustomer.fromJson(Map<String, dynamic> json) {
    return MenuCustomer(
      id: json['id'],
      firstName: json['firstName'],
      middleName: json['middleName'],
      lastName: json['lastName'],
      email: json['email'],
      mobile: json['mobile'],
      altMobile: json['altMobile'],
      dob: json['dob'],
      gender: json['gender'],
      printName: json['printName'],
      profileImage: json['profileImage'],

      permanentAddress: json['Permanent_Address'],
      permanentCity: json['Permanent_City'],
      permanentState: json['Permanent_State'],
      permanentCountry: json['Permanent_Country'],

      correspondingAddress: json['Corresponding_Address'],
      correspondingCity: json['Corresponding_City'],
      correspondingState: json['Corresponding_State'],
      correspondingCountry: json['Corresponding_Country'],
    );
  }
}
