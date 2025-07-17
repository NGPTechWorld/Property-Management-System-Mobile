enum PropertyOwnershipType {
  tabo('طابو أخضر (ملكية نظامية)'),
  unregulatedTabo('طابو غير منظم'),
  ifragh('إفراز رسمي'),
  sanadTamlok('سند تمليك'),
  mukhabarat('مخاتير أو كتب تمليك'),
  waqf('وقف'),
  agricultural('زراعي'),
  mashaa('مشاع'),
  iskan('إسكان'),
  taawin('تعاوني سكني'),
  mukhabaratNizami('مخاتير مع تنظيم'),
  withoutDocuments('بدون أوراق ثبوتية');

  final String value;
  const PropertyOwnershipType(this.value);

  factory PropertyOwnershipType.fromValue(String value) {
    return PropertyOwnershipType.values.firstWhere(
      (e) => e.value == value,
      orElse: () => PropertyOwnershipType.withoutDocuments,
    );
  }
}
