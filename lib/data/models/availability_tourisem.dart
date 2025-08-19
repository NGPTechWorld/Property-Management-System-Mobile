class DayAvailabilityDto {
  final String date;
  final String status;

  DayAvailabilityDto({required this.date, required this.status});

  factory DayAvailabilityDto.fromJson(Map<String, dynamic> json) =>
      DayAvailabilityDto(
        date: json['date']?.toString() ?? '',
        status: json['status']?.toString() ?? '',
      );

  Map<String, dynamic> toJson() => {'date': date, 'status': status};

  factory DayAvailabilityDto.empty() =>
      DayAvailabilityDto(date: '', status: 'غير معروف');

  static List<DayAvailabilityDto> fromJsonArray(List<dynamic> jsonArray) {
    return jsonArray.map((e) => DayAvailabilityDto.fromJson(e)).toList();
  }
}

class AvailabilityDto {
  final List<DayAvailabilityDto> days;
  final int availableCount;
  final double price;
  final double deposit;
  final double commission;

  AvailabilityDto({
    required this.days,
    required this.availableCount,
    required this.price,
    required this.deposit,
    required this.commission,
  });

  factory AvailabilityDto.fromJson(Map<String, dynamic> json) =>
      AvailabilityDto(
        days:
            json['days'] != null
                ? DayAvailabilityDto.fromJsonArray(json['days'])
                : [],
        availableCount:
            json['availableCount'] is num
                ? (json['availableCount'] as num).toInt()
                : int.tryParse(json['availableCount'].toString()) ?? 0,
        price:
            (json['price'] is num
                    ? json['price']
                    : double.tryParse(json['price'].toString()))
                ?.toDouble() ??
            0.0,
        deposit:
            (json['deposit'] is num
                    ? json['deposit']
                    : double.tryParse(json['deposit'].toString()))
                ?.toDouble() ??
            0.0,
        commission:
            (json['commission'] is num
                    ? json['commission']
                    : double.tryParse(json['commission'].toString()))
                ?.toDouble() ??
            0.0,
      );

  Map<String, dynamic> toJson() => {
    'days': days.map((e) => e.toJson()).toList(),
    'availableCount': availableCount,
    'price': price,
    'deposit': deposit,
    'commission': commission,
  };

  factory AvailabilityDto.empty() => AvailabilityDto(
    days: [],
    availableCount: 0,
    price: 0.0,
    deposit: 0.0,
    commission: 0.0,
  );
}
