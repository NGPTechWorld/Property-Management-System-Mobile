enum TourismPlaceWaterStatus {
  availableAlways('مياه متوفرة دائمًا'),
  scheduled('مياه مقطوعة جزئيًا (دوامية)'),
  withTank('يوجد خزان مياه خاص'),
  wellWater('مياه من بئر'),
  noWater('لا توجد مياه');

  final String value;
  const TourismPlaceWaterStatus(this.value);

  factory TourismPlaceWaterStatus.fromValue(String value) {
    return TourismPlaceWaterStatus.values.firstWhere(
      (e) => e.value == value,
      orElse: () => TourismPlaceWaterStatus.noWater,
    );
  }
}
