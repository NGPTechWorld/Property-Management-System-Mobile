class UserReservationDto {
  final int? id;
  final int? propertyId;
  final String title;
  final String state;
  final String type;
  final String image;
  final String startDate;
  final String endDate;
  final String location;
  final String rentalPeriod;
  final int rentalPrice;

  UserReservationDto({
    this.id,
    this.propertyId,
    required this.type,
    required this.title,
    required this.state,
    required this.image,
    required this.startDate,
    required this.endDate,
    required this.location,
    required this.rentalPeriod,
    required this.rentalPrice,
  });

  factory UserReservationDto.fromJson(Map<String, dynamic> json) =>
      UserReservationDto(
        id: json['id'] ?? 0,
        propertyId: json['property_id'] ?? 0,
        title: json['title'] ?? '',
        state: json['status'] ?? '',
        type: json['type'] ?? '',
        image: json['image'] ?? '',
        startDate: json['start_date'] ?? '',
        endDate: json['end_date'] ?? '',
        location: json['location'] ?? '',
        rentalPrice: json['rental_price'] ?? 0,
        rentalPeriod: json['rental_period'] ?? '',
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'property_id': propertyId,
    'type': type,
    'image': image,
    'start_date': startDate,
    'end_date': endDate,
    'location': location,
  };

  factory UserReservationDto.empty() => UserReservationDto(
    id: 0,
    propertyId: 0,
    title: 'عنوان العقار',
    state: '',
    type: '',
    image: '',
    startDate: '',
    endDate: '',
    location: 'الموقع',
    rentalPeriod: "نوع الإجار",
    rentalPrice: 0,
  );
}
