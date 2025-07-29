// ignore_for_file: public_member_api_docs, sort_constructors_first
enum SyrianGovernorate {
  damascus('دمشق', 1),
  rifDimashq('ريف دمشق', 2),
  aleppo('حلب', 3),
  homs('حمص', 4),
  hama('حماة', 5),
  latakia('اللاذقية', 6),
  tartous('طرطوس', 7),
  idlib('إدلب', 8),
  raqqa('الرقة', 9),
  deirEzzor('دير الزور', 10),
  hasakah('الحسكة', 11),
  daraa('درعا', 12),
  sweida('السويداء', 13),
  quneitra('القنيطرة', 14);

  final String value;
  final int id;
  const SyrianGovernorate(this.value, this.id);

  factory SyrianGovernorate.fromValue(String value) {
    return SyrianGovernorate.values.firstWhere(
      (e) => e.value == value,
      orElse: () => SyrianGovernorate.damascus,
    );
  }
}

class City {
  final int id;
  final String name;
  City({required this.id, required this.name});
}

Map<SyrianGovernorate, List<City>> syrianGovernoratesAreas = {
  SyrianGovernorate.damascus: [
    City(id: 1, name: 'المزة'),
    City(id: 2, name: 'المالكي'),
    City(id: 3, name: 'برزة'),
    City(id: 4, name: 'ركن الدين'),
    City(id: 5, name: 'الصالحية'),
    City(id: 6, name: 'الزاهرة'),
    City(id: 7, name: 'مشروع دمر'),
    City(id: 8, name: 'القدم'),
    City(id: 9, name: 'كفرسوسة'),
    City(id: 10, name: 'باب توما'),
    City(id: 11, name: 'العمارة'),
    City(id: 12, name: 'الميدان'),
    City(id: 13, name: 'الشاغور'),
    City(id: 14, name: 'جوبر'),
    City(id: 15, name: 'القابون'),
    City(id: 16, name: 'المهاجرين'),
  ],
  SyrianGovernorate.rifDimashq: [
    City(id: 17, name: 'جرمانا'),
    City(id: 18, name: 'صحنايا'),
    City(id: 19, name: 'قدسيا'),
    City(id: 20, name: 'دوما'),
    City(id: 21, name: 'حرستا'),
    City(id: 22, name: 'التل'),
    City(id: 23, name: 'معضمية الشام'),
    City(id: 24, name: 'يبرود'),
    City(id: 25, name: 'الكسوة'),
    City(id: 26, name: 'الزبداني'),
    City(id: 27, name: 'سقبا'),
    City(id: 28, name: 'داريا'),
    City(id: 29, name: 'النبك'),
    City(id: 30, name: 'عين ترما'),
  ],
  SyrianGovernorate.aleppo: [
    City(id: 31, name: 'الفرقان'),
    City(id: 32, name: 'الأعظمية'),
    City(id: 33, name: 'السليمانية'),
    City(id: 34, name: 'الجميلية'),
    City(id: 35, name: 'المشارقة'),
    City(id: 36, name: 'الشيخ مقصود'),
    City(id: 37, name: 'الحمدانية'),
    City(id: 38, name: 'صلاح الدين'),
    City(id: 39, name: 'الأنصاري'),
    City(id: 40, name: 'الميدان'),
    City(id: 41, name: 'الهلك'),
    City(id: 42, name: 'باب النيرب'),
    City(id: 43, name: 'الراموسة'),
  ],
  SyrianGovernorate.homs: [
    City(id: 44, name: 'الوعر'),
    City(id: 45, name: 'بابا عمرو'),
    City(id: 46, name: 'الخالدية'),
    City(id: 47, name: 'الإنشاءات'),
    City(id: 48, name: 'عكرمة'),
    City(id: 49, name: 'حي الزهراء'),
    City(id: 50, name: 'كرم الشامي'),
    City(id: 51, name: 'باب تدمر'),
    City(id: 52, name: 'دير بعلبة'),
    City(id: 53, name: 'الحميدية'),
  ],
  SyrianGovernorate.hama: [
    City(id: 54, name: 'القصور'),
    City(id: 55, name: 'العمري'),
    City(id: 56, name: 'الضاحية'),
    City(id: 57, name: 'الجلاء'),
    City(id: 58, name: 'جنوب الملعب'),
    City(id: 59, name: 'المدينة'),
    City(id: 60, name: 'الطريق الحربي'),
    City(id: 61, name: 'الصابونية'),
  ],
  SyrianGovernorate.latakia: [
    City(id: 62, name: 'الصليبة'),
    City(id: 63, name: 'المشروع العاشر'),
    City(id: 64, name: 'الرمل الجنوبي'),
    City(id: 65, name: 'رأس شمرا'),
    City(id: 66, name: 'الدعتور'),
    City(id: 67, name: 'الشيخ ضاهر'),
    City(id: 68, name: 'حي الزقزقانية'),
  ],
  SyrianGovernorate.tartous: [
    City(id: 69, name: 'الكرامة'),
    City(id: 70, name: 'الدوير'),
    City(id: 71, name: 'القدموس'),
    City(id: 72, name: 'بانياس'),
    City(id: 73, name: 'صافيتا'),
    City(id: 74, name: 'دريكيش'),
    City(id: 75, name: 'الشيخ بدر'),
    City(id: 76, name: 'مشتى الحلو'),
  ],
  SyrianGovernorate.idlib: [
    City(id: 77, name: 'معرة النعمان'),
    City(id: 78, name: 'خان شيخون'),
    City(id: 79, name: 'أريحا'),
    City(id: 80, name: 'بنش'),
    City(id: 81, name: 'سرمين'),
    City(id: 82, name: 'كفرنبل'),
    City(id: 83, name: 'سراقب'),
  ],
  SyrianGovernorate.raqqa: [
    City(id: 84, name: 'الطبقة'),
    City(id: 85, name: 'المنصورة'),
    City(id: 86, name: 'معدان'),
  ],
  SyrianGovernorate.deirEzzor: [
    City(id: 87, name: 'الميادين'),
    City(id: 88, name: 'البوكمال'),
    City(id: 89, name: 'موحسن'),
    City(id: 90, name: 'القورية'),
    City(id: 91, name: 'العشارة'),
  ],
  SyrianGovernorate.hasakah: [
    City(id: 92, name: 'القامشلي'),
    City(id: 93, name: 'رأس العين'),
    City(id: 94, name: 'عامودا'),
    City(id: 95, name: 'المالكية'),
    City(id: 96, name: 'تل تمر'),
  ],
  SyrianGovernorate.daraa: [
    City(id: 97, name: 'نوى'),
    City(id: 98, name: 'طفس'),
    City(id: 99, name: 'ازرع'),
    City(id: 100, name: 'بصرى الشام'),
    City(id: 101, name: 'جاسم'),
    City(id: 102, name: 'الشيخ مسكين'),
    City(id: 103, name: 'الصنمين'),
  ],
  SyrianGovernorate.sweida: [
    City(id: 104, name: 'شهبا'),
    City(id: 105, name: 'صلخد'),
    City(id: 106, name: 'القريا'),
    City(id: 107, name: 'عتيل'),
    City(id: 108, name: 'قنوات'),
  ],
  SyrianGovernorate.quneitra: [
    City(id: 109, name: 'خان أرنبة'),
    City(id: 110, name: 'جباتا الخشب'),
    City(id: 111, name: 'حضر'),
    City(id: 112, name: 'الرفيد'),
  ],
};
