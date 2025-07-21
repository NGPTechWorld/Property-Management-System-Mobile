class ServiceDetailModel {
  final String title;
  final String image;
  final String description;
  final String serviceType;
  final double rating;
  final String location;
  final String startWork;
  final String endWork;
  final String phoneNumber;
  final String instagramUrl;
  final String whatsappUrl;
  final String facebookUrl;

  const ServiceDetailModel({
    required this.title,
    required this.image,
    required this.description,
    required this.serviceType,
    required this.rating,
    required this.location,
    required this.startWork,
    required this.endWork,
    required this.phoneNumber,
    required this.instagramUrl,
    required this.whatsappUrl,
    required this.facebookUrl,
  });
}
