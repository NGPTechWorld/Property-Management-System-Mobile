import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/features/widgets/office_card.dart';
import 'package:property_ms/features/widgets/tourisem_card.dart';
import 'package:property_ms/features/widgets/tourisem_card_small.dart';

class TourismDetailsController extends GetxController {
  RxDouble rating = 4.0.obs;
  // for carousel
  var isLoadingImages = true.obs;
  final RxInt sliderIndex = 0.obs;
  // tourism detail model id
  final TourisemCardSmallModel tourism =
      Get.arguments as TourisemCardSmallModel;

  //! Rating update
  void updateRating(double newRating) {
    rating.value = newRating;

    // Optional: update the model
    // model.rate = newRating.toString();

    // Optional: send rating to backend or local DB
    print('Updated rating: $newRating');
  }

  //For carousel
  final images = [
    Assets.images.officePropertyCard,
    Assets.images.officeServicesCard,
    Assets.images.propertyCard,
  ];

  final recommendedTourisem = [
    TourisemCardModel(
      title: 'شقة 100 م²',
      location: 'دمشق, شعلان',
      priceUnit: 'شهري',
      rate: 4.5,
      price: 2500,
      image: Assets.images.property,
    ),
    TourisemCardModel(
      title: 'شقة 100 م²',
      location: 'دمشق, شعلان',
      priceUnit: 'شهري',
      rate: 4.5,
      price: 2500,
      image: Assets.images.property,
    ),
    TourisemCardModel(
      title: 'شقة 100 م²',
      location: 'دمشق, شعلان',
      priceUnit: 'شهري',
      rate: 4.5,
      price: 2500,
      image: Assets.images.property,
    ),
  ];

  // repsonsible office model
  final repsonsibleOffice = OfficeCardModel(
    title: 'مكتب أبو فراس',
    type: 'عقاري',
    location: 'دمشق, ميدان',
    rate: 4.75,
    image: Assets.images.propertyImage,
  );

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 2), () {
      isLoadingImages.value = false;
    });
    super.onInit();
  }
}
