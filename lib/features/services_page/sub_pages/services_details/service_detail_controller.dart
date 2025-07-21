import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/features/services_page/sub_pages/services_details/models/service_detail_model.dart';

class ServiceDetailController extends GetxController {
  RxDouble rating = 4.0.obs;

  // Example usage
  final serviceDetaitModel = ServiceDetailModel(
    title: 'المصور علي',
    image: Assets.images.propertyCard.path,
    description: 'هذه الخدمة تقدم تصويراً احترافياً للعقارات ...',
    serviceType: 'تصوير',
    rating: 4.5,
    location: 'دمشق ميدان',
    startWork: '10:30',
    endWork: '10:30',
    phoneNumber: '0987654321',
    instagramUrl: 'https://www.instagram.com/flutter.dev/',
    whatsappUrl: 'https://wa.me/0988861119',
    facebookUrl: 'https://www.facebook.com/fluttercommunity',
  );

  void updateOfficeRating(double newRating) {
    rating.value = newRating;

    // Optional: update the model
    // model.rate = newRating.toString();

    // Optional: send rating to backend or local DB
    print('Updated rating: $newRating');
  }
}
