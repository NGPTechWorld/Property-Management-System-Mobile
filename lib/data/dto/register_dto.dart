import 'dart:io';

import 'package:property_ms/core/utils/helper/extensions.dart';

class RegisterDto {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String password;
  final File? profileImage;

  RegisterDto({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.password,
    this.profileImage,
  });

  Future<Map<String, dynamic>> toJson() async {
    final profileMultipart = await profileImage?.toMultipartFile1();
    return <String, dynamic>{
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
      'phone': phoneNumber,
      if (profileMultipart != null) ...{"photo": profileMultipart},
    };
  }
}
