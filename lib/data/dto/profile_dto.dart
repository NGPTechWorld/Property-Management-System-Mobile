class ProfileDto {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String? photoUrl;

  ProfileDto({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    this.photoUrl,
  });

  factory ProfileDto.fromJson(Map<String, dynamic> json) => ProfileDto(
    firstName: json['first_name']?.toString() ?? '',
    lastName: json['last_name']?.toString() ?? '',
    email: json['email']?.toString() ?? '',
    phone: json['phone']?.toString() ?? '',
    photoUrl: json['photo_url']?.toString(),
  );

  Map<String, dynamic> toJson() => {
    'first_name': firstName,
    'last_name': lastName,
    'email': email,
    'phone': phone,
    'photo_url': photoUrl,
  };

  factory ProfileDto.empty() => ProfileDto(
    firstName: 'الاسم الأول',
    lastName: 'الكنية',
    email: '',
    phone: '',
    photoUrl: null,
  );
}
