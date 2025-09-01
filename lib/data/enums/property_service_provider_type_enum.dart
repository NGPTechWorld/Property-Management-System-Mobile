enum PropertyServiceProviderType {
  all('الكل'),
  electrician('كهربائي'),
  plumber('سباك'),
  painter('دهان'),
  carpenter('نجار'),
  interiorDesigner('مصمم ديكور'),
  houseCleaner('خدمات تنظيف'),
  furnitureMover('خدمات نقل عفش'),
  airConditionerTechnician('تبريد وتكييف'),
  glassInstaller('تركيب زجاج'),
  aluminumWorker('أعمال ألومنيوم'),
  securitySystems('أنظمة أمان ومراقبة'),
  buildingMaintenance('صيانة عامة'),
  satelliteTechnician('تركيب دش وأقمار صناعية'),
  internetTechnician('فني إنترنت واتصالات'),
  tilesInstaller('تركيب أرضيات'),
  curtainsInstaller('تركيب ستائر'),
  roofingSpecialist('عزل وأسقف'),
  gardenMaintenance('تنسيق حدائق'),
  blacksmith('لحام وحدادة'),
  locksmith('تركيب أبواب ونوافذ');

  final String value;
  const PropertyServiceProviderType(this.value);

  factory PropertyServiceProviderType.fromValue(String value) {
    return PropertyServiceProviderType.values.firstWhere(
      (e) => e.value == value,
      orElse: () => PropertyServiceProviderType.all,
    );
  }
}
