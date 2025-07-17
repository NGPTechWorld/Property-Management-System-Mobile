enum PropertyPostStatus {
  pending('قيد الانتظار'),
  approved('مقبول'),
  rejected('مرفوض');

  final String value;
  const PropertyPostStatus(this.value);

  factory PropertyPostStatus.fromValue(String value) {
    return PropertyPostStatus.values.firstWhere(
      (e) => e.value == value,
      orElse: () => PropertyPostStatus.pending,
    );
  }
}
