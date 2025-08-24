class RentalDto {
  final int propertyId;
  final int periodCount;
  final double totalPrice;
  final String paymentIntentId;

  RentalDto({
    required this.propertyId,
    required this.periodCount,
    required this.totalPrice,
    required this.paymentIntentId,
  });
  factory RentalDto.fromJson(Map<String, dynamic> json) {
    return RentalDto(
      propertyId: json['propertyId'] as int,
      periodCount: json['periodCount'] as int,
      totalPrice: (json['totalPrice'] as num).toDouble(),
      paymentIntentId: json['paymentIntentId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'propertyId': propertyId,
      'periodCount': periodCount,
      'totalPrice': totalPrice,
      'paymentIntentId': paymentIntentId,
    };
  }
}
