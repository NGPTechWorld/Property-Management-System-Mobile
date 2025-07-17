enum PropertyFurnishingType {
  fullyFurnished('مفروش بالكامل'),
  semiFurnished('مفروش جزئيًا'),
  unfurnished('غير مفروش'),
  luxuryFurnished('فرش فاخر'),
  basicFurnished('فرش بسيط'),
  kitchenOnly('مطبخ فقط');

  final String value;
  const PropertyFurnishingType(this.value);

  factory PropertyFurnishingType.fromValue(String value) {
    return PropertyFurnishingType.values.firstWhere(
      (e) => e.value == value,
      orElse: () => PropertyFurnishingType.unfurnished,
    );
  }
}
