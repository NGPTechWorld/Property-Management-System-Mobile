import 'dart:convert';

class PaymentDto {
  final String clientSecret;
  final String paymentId;

  PaymentDto({required this.clientSecret, required this.paymentId});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'clientSecret': clientSecret,
      'paymentId': paymentId,
    };
  }

  factory PaymentDto.fromMap(Map<String, dynamic> map) {
    return PaymentDto(
      paymentId: map['paymentId'] as String,
      clientSecret: map['clientSecret'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentDto.fromJson(String source) =>
      PaymentDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
