import 'dart:convert';

class CommissionDto {
  final double commission;
  final double deposit;

  CommissionDto({required this.commission, required this.deposit});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'commission': commission,
      'deposit_per_m2': deposit,
    };
  }

  factory CommissionDto.fromMap(Map<String, dynamic> map) {
    return CommissionDto(
      commission: map['commission'] as double,
      deposit: map['deposit_per_m2'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory CommissionDto.fromJson(String source) =>
      CommissionDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
