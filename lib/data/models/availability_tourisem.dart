import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AvailabilityModel {
  final List<DayModel> days;
  final int availableCount;
  final double price;
  final double deposit;
  final double commission;

  AvailabilityModel({
    required this.days,
    required this.availableCount,
    required this.price,
    required this.deposit,
    required this.commission,
  });

  factory AvailabilityModel.fromJson(Map<String, dynamic> json) {
    return AvailabilityModel(
      days:
          (json['days'] as List<dynamic>)
              .map((e) => DayModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      availableCount: json['availableCount'] ?? 0,
      price: (json['price'] as num).toDouble(),
      deposit: (json['deposit'] as num).toDouble(),
      commission: (json['commission'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "days": days.map((e) => e.toJson()).toList(),
      "availableCount": availableCount,
      "price": price,
      "deposit": deposit,
      "commission": commission,
    };
  }
}

class DayModel {
  final String date;
  final String status;

  DayModel({required this.date, required this.status});

  factory DayModel.fromJson(Map<String, dynamic> json) {
    return DayModel(date: json['date'] ?? '', status: json['status'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {"date": date, "status": status};
  }

  DateModel toDateModel() {
    final parts = date.split('-');
    final int dayNum = int.parse(parts[0]);
    final int monthNum = int.parse(parts[1]);
    final int yearNum = int.parse(parts[2]);

    final dateTime = DateTime(yearNum, monthNum, dayNum);

    return DateModel(
      day: DateFormat('EEEE', 'ar').format(dateTime),
      month: DateFormat("MMM", "ar").format(dateTime),
      numDay: DateFormat("d").format(dateTime),
      isReseved: status != "متوفر",
      isSelect: false.obs,
      date: dateTime,
    );
  }
}

class DateModel {
  final String day;
  final String month;
  final String numDay;
  bool isReseved;
  final RxBool isSelect;
  final DateTime date;

  DateModel({
    required this.day,
    required this.month,
    required this.numDay,
    required this.isReseved,
    required this.isSelect,
    required this.date,
  });
}
