import 'package:dio/dio.dart';

class SignupInput {
  final String name;
  final String email;
  final String phone;
  final String password;
  final String confirmPassword;
  String? fcmToken;

  SignupInput({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phone,
    this.fcmToken,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
        "passwordConfirm": confirmPassword,
        "deviceId": fcmToken,
      };

  FormData toFormData() => FormData.fromMap({
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
        "passwordConfirm": confirmPassword,
        "deviceId": fcmToken,
      });
}
