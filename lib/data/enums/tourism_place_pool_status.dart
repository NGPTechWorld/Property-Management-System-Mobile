enum TourismPlacePoolStatus {
  privatePool('مسبح خاص'),
  sharedPool('مسبح مشترك'),
  heatedPool('مسبح مدفأ'),
  noPool('لا يوجد مسبح'),
  underMaintenance('مسبح غير صالح حالياً (صيانة)');

  final String value;
  const TourismPlacePoolStatus(this.value);

  factory TourismPlacePoolStatus.fromValue(String value) {
    return TourismPlacePoolStatus.values.firstWhere(
      (e) => e.value == value,
      orElse: () => TourismPlacePoolStatus.noPool,
    );
  }
}
