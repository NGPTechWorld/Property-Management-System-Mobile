enum TourismPlaceElectricityStatus {
  availableAlways('كهرباء متوفرة دائمًا'),
  scheduled('كهرباء مقطوعة جزئيًا (دوامية)'),
  withGenerator('يوجد مولدة خاصة'),
  solarSystem('نظام طاقة شمسية'),
  noElectricity('لا توجد كهرباء');

  final String value;
  const TourismPlaceElectricityStatus(this.value);

  factory TourismPlaceElectricityStatus.fromValue(String value) {
    return TourismPlaceElectricityStatus.values.firstWhere(
      (e) => e.value == value,
      orElse: () => TourismPlaceElectricityStatus.noElectricity,
    );
  }
}
