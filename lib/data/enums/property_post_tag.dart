enum PropertyPostTag {
  apartment('شقة'),
  building('عمارة'),
  land('أرض'),
  villa('فيلا'),
  duplex('دوبلكس'),
  studio('استوديو'),
  house('بيت'),
  roof('روف'),
  shop('محل تجاري'),
  office('مكتب'),
  showroom('معرض'),
  warehouse('مخزن'),
  farm('مزرعة'),
  chalet('شاليه'),
  resort('منتجع'),
  factory('مصنع'),
  storage('مستودع'),
  laborCamp('سكن عمال'),
  garage('كراج'),
  tower('برج'),
  hotel('فندق');

  final String value;
  const PropertyPostTag(this.value);

  factory PropertyPostTag.fromValue(String value) {
    return PropertyPostTag.values.firstWhere(
      (e) => e.value == value,
      orElse: () => PropertyPostTag.apartment,
    );
  }
}
