enum PropertyAvailabilityStatus {
  reserved('محجوز'),
  rented('تم التأجير'),
  sold('تم البيع'),
  unavailable('غير متوفر'),
  underMaintenance('في الصيانة'),
  available('متوفر');

  final String value;
  const PropertyAvailabilityStatus(this.value);

  factory PropertyAvailabilityStatus.fromValue(String value) {
    return PropertyAvailabilityStatus.values.firstWhere(
      (e) => e.value == value,
      orElse: () => PropertyAvailabilityStatus.available,
    );
  }
}
