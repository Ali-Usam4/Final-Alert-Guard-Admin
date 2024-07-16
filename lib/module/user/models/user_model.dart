class UserModel {
  String id;
  String firstName;
  String lastName;
  String profileImage;
  String email;
  String phone;
  List<dynamic> address;
  String role;
  double rating;
  String deviceId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.profileImage,
    required this.email,
    required this.phone,
    required this.address,
    required this.role,
    required this.rating,
    required this.deviceId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        profileImage: json["profileImage"],
        email: json["email"],
        phone: json["phone"],
        address: List<dynamic>.from(json["address"].map((x) => x)),
        role: json["role"],
        rating: json["rating"] ?? 0.0,
        deviceId: json["deviceId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "profileImage": profileImage,
        "email": email,
        "phone": phone,
        "address": List<dynamic>.from(address.map((x) => x)),
        "role": role,
        "rating": rating,
        "deviceId": deviceId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };

  static UserModel empty = UserModel(
    id: '',
    firstName: '',
    lastName: '',
    email: '',
    address: [],
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    role: '',
    deviceId: '',
    phone: '',
    profileImage: '',
    v: -1,
    rating: -1,
  );
}

class Address {
  Location location;
  String id;
  String address;
  bool active;

  Address({
    required this.location,
    required this.id,
    required this.address,
    required this.active,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        location: Location.fromJson(json["location"]),
        id: json["_id"],
        address: json["address"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "_id": id,
        "address": address,
        "active": active,
      };
}

class Location {
  String type;
  List<double> coordinates;

  Location({
    required this.type,
    required this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        type: json["type"],
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
      };
}
