import 'dart:convert';

import '../../user/models/user_model.dart';

AuthResponse authResponseFromJson(String str) => AuthResponse.fromJson(json.decode(str));

String authResponseToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
  String result;
  String message;
  UserModel data;
  String token;

  AuthResponse({
    required this.result,
    required this.message,
    required this.data,
    required this.token,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        result: json["result"],
        message: json["message"],
        data: UserModel.fromJson(json["data"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "data": data.toJson(),
        "token": token,
      };
}

class Service {
  String id;
  String name;

  Service({
    required this.id,
    required this.name,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
      };
}
