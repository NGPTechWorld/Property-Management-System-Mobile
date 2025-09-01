class ResidentialDto {
  final int propertyId;
  final double deposit;
  final double totalPrice;
  final String paymentIntentId;
  final bool installment;

  ResidentialDto({
    required this.propertyId,
    required this.deposit,
    required this.totalPrice,
    required this.paymentIntentId,
    required this.installment,
  });

  factory ResidentialDto.fromJson(Map<String, dynamic> json) {
    return ResidentialDto(
      propertyId: json['propertyId'] as int,
      deposit: json['deposit'] as double,
      totalPrice: json['totalPrice'] as double,
      paymentIntentId: json['paymentIntentId'] as String,
      installment: json['installment'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'propertyId': propertyId,
      'deposit': deposit,
      'totalPrice': totalPrice,
      'paymentIntentId': paymentIntentId,
      'installment': installment,
    };
  }
}
