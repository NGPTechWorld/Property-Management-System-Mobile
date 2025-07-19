// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginDto {
  final String accessToken;
  final String refreshToken;

  LoginDto({required this.accessToken, required this.refreshToken});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  factory LoginDto.fromMap(Map<String, dynamic> map) {
    return LoginDto(
      accessToken: map['accessToken'] as String,
      refreshToken: map['refreshToken'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginDto.fromJson(String source) =>
      LoginDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
