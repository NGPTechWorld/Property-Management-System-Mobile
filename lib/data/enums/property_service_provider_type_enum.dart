enum PropertyServiceProviderType {
  electrician('كهربائي'),
  plumber('سبّاك (تمديدات صحية)'),
  painter('دهّان'),
  furnitureMover('نقل عفش'),
  interiorDesigner('تصميم داخلي'),
  carpenter('نجّار'),
  aluminumWorker('ألمنيوم وزجاج'),
  blacksmith('حدّاد'),
  airConditionerTechnician('فني تكييف'),
  satelliteTechnician('فني ستلايت'),
  houseCleaner('تنظيف منازل'),
  buildingMaintenance('صيانة مباني'),
  elevatorTechnician('فني مصاعد'),
  pestControl('مكافحة الحشرات'),
  waterTankCleaner('تنظيف خزانات مياه'),
  locksmith('فتح أقفال وصيانة أبواب'),
  securitySystems('أنظمة مراقبة وإنذار'),
  solarPanelInstaller('تركيب طاقة شمسية'),
  gardenMaintenance('تنسيق وصيانة حدائق'),
  swimmingPoolMaintenance('صيانة مسابح'),
  constructionContractor('مقاول بناء وترميم'),
  roofingSpecialist('تسقيف وعزل مائي وحراري'),
  glassInstaller('تركيب زجاج وواجهات'),
  tilesInstaller('تركيب سيراميك وبلاط');

  final String value;
  const PropertyServiceProviderType(this.value);

  factory PropertyServiceProviderType.fromValue(String value) {
    return PropertyServiceProviderType.values.firstWhere(
      (e) => e.value == value,
      orElse: () => PropertyServiceProviderType.electrician,
    );
  }
}
