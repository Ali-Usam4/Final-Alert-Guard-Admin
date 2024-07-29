class CompanyPinModel {
  final String companyName;
  final String managerName;
  final String phone;
  final String address;
  final String city;
  final String state;
  final String additionalInfo;
  final String pin;
  final DateTime dateTime;

  CompanyPinModel({
    required this.companyName,
    required this.managerName,
    required this.phone,
    required this.address,
    required this.city,
    required this.state,
    required this.additionalInfo,
    required this.pin,
    required this.dateTime,
  });

  Map<String, dynamic> toJson() {
    return {
      'companyName': companyName,
      'managerName': managerName,
      'phone': phone,
      'address': address,
      'city': city,
      'state': state,
      'additionalInfo': additionalInfo,
      'pin': pin,
      'dateTime': dateTime.toIso8601String(),
    };
  }

  factory CompanyPinModel.fromJson(Map<String, dynamic> map) {
    return CompanyPinModel(
      companyName: map['companyName'],
      managerName: map['managerName'],
      phone: map['phone'],
      address: map['address'],
      city: map['city'],
      state: map['state'],
      additionalInfo: map['additionalInfo'],
      pin: map['pin'],
      dateTime: DateTime.parse(map['dateTime']),
    );
  }
}

class UserPinModel {
  final String name;
  final String phone;
  final String address;
  final String city;
  final String state;
  final String pin;
  final DateTime dateTime;

  UserPinModel({
    required this.name,
    required this.phone,
    required this.address,
    required this.city,
    required this.state,
    required this.pin,
    required this.dateTime,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'address': address,
      'city': city,
      'state': state,
      'pin': pin,
      'dateTime': dateTime.toIso8601String(),
    };
  }

  factory UserPinModel.fromJson(Map<String, dynamic> map) {
    return UserPinModel(
      name: map['name'],
      phone: map['phone'],
      address: map['address'],
      city: map['city'],
      state: map['state'],
      pin: map['pin'],
      dateTime: DateTime.parse(map['dateTime']),
    );
  }
}
