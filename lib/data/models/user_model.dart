
class UserModel {
  final int id;
  final String firstName;
  final String lastName;
  final String? email;
  final String phoneNumber;
  final String userName;
  final String gender;
  final DateTime? birthDate;
  final bool isActive;
  final bool isStore;
  final String? image;
  final DateTime? phoneVerifiedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserModel({
    this.id = 0,
    this.phoneNumber = "",
    this.firstName = "",
    this.lastName = "",
    this.email = "",
    this.userName = "",
    this.gender = "",
    this.birthDate,
    this.isActive = false,
    this.isStore = false,
    this.image,
    this.phoneVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  UserModel copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? userName,
    String? gender,
    DateTime? birthDate,
    bool? isActive,
    bool? isStore,
    String? image,
    DateTime? phoneVerifiedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => UserModel(
    id: id ?? this.id,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    email: email ?? this.email,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    userName: userName ?? this.userName,
    gender: gender ?? this.gender,
    birthDate: birthDate ?? this.birthDate,
    isActive: isActive ?? this.isActive,
    isStore: isStore ?? this.isStore,
    image: image ?? this.image,
    phoneVerifiedAt: phoneVerifiedAt ?? this.phoneVerifiedAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );

}
