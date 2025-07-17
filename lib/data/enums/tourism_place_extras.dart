enum TourismPlaceExtras {
  barbecueArea('مكان للشواء'),
  garden('حديقة'),
  kidsPlayArea('منطقة ألعاب أطفال'),
  seaView('إطلالة بحرية'),
  mountainView('إطلالة جبلية'),
  balcony('شرفة (بلكون)'),
  jacuzzi('جاكوزي'),
  sauna('ساونا'),
  fireplace('مدفأة'),
  parking('موقف سيارات'),
  security('حراسة / أمان'),
  internet('انترنت واي فاي'),
  satellite('تلفزيون مع قنوات فضائية'),
  airConditioning('تكييف هواء'),
  sportsField('ملعب رياضي');

  final String value;
  const TourismPlaceExtras(this.value);

  factory TourismPlaceExtras.fromValue(String value) {
    return TourismPlaceExtras.values.firstWhere(
      (e) => e.value == value,
      orElse: () => TourismPlaceExtras.parking,
    );
  }
}
