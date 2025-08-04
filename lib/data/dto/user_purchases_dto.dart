class UserPurchasesDto {
  final int id;
  final String status;
  final String date;
  final int propertyId;
  final int sellingPrice;
  final String title;
  final String image;
  final String address;

  UserPurchasesDto({
    required this.id,
    required this.status,
    required this.date,
    required this.propertyId,
    required this.title,
    required this.image,
    required this.address,
    required this.sellingPrice,
  });

  factory UserPurchasesDto.fromJson(Map<String, dynamic> json) =>
      UserPurchasesDto(
        id: json['id'] ?? 0,
        status: json['status'] ?? '',
        date: json['date'] ?? '',
        propertyId: json['property_id'] ?? 0,
        sellingPrice: json['selling_price'] ?? 0,
        title: json['title'] ?? '',
        image: json['image'] ?? '',
        address: json['address'] ?? '',
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'status': status,
    'date': date,
    'property_id': propertyId,
    'title': title,
    'image': image,
    'address': address,
  };
  factory UserPurchasesDto.empty() => UserPurchasesDto(
    id: 0,
    status: '',
    date: '',
    propertyId: 0,
    title: 'العنوان',
    image: '',
    address: 'الموقع',
    sellingPrice: 0,
  );
}
