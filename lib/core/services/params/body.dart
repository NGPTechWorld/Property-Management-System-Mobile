abstract class Body {
  Map<String, dynamic> toMap();
}

class NoBody extends Body {
  @override
  Map<String, dynamic> toMap() {
    return {};
  }
}

class TemplateBody extends Body {
  final String firstName;
  final String fatherName;
  final String lastName;
  final String phone;
  final String city;
  final String email;
  final String password;
  final String school;
  final String typeId;
  final String deviceId;

  static const String firstNameKey = 'first_name';
  static const String fatherNameKey = 'father_name';
  static const String lastNameKey = 'last_name';
  static const String phoneKey = 'phone';
  static const String cityKey = 'city';
  static const String emailKey = 'email';
  static const String passwordKey = 'password';
  static const String schoolKey = 'school';
  static const String typeIdKey = 'type_id';
  static const String deviceIdKey = 'device_id';

  TemplateBody({
    required this.firstName,
    required this.fatherName,
    required this.lastName,
    required this.phone,
    required this.city,
    required this.email,
    required this.password,
    required this.school,
    required this.typeId,
    required this.deviceId,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      firstNameKey: firstName,
      fatherNameKey: fatherName,
      lastNameKey: lastName,
      phoneKey: phone,
      cityKey: city,
      emailKey: email,
      passwordKey: password,
      schoolKey: school,
      typeIdKey: typeId,
      deviceIdKey: deviceId,
    };
  }
}


//! here you can add more body classes for your requests
