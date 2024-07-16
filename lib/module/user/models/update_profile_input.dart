import 'package:dio/dio.dart';

class UpdateProfileInput {
  final String firstName;
  final String lastName;
  final String phone;
  MultipartFile? profileImage;
  UpdateProfileInput( {required this.lastName,required this.phone,required this.firstName,this.profileImage});
  FormData toFormData() => FormData.fromMap({
        'firstName': firstName,
        'lastName': lastName,
        'profileImage': profileImage,
      });
}
