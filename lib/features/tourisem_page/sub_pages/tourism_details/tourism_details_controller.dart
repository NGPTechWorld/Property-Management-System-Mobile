import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/features/tourisem_page/sub_pages/tourism_details/models/tourism_detail_model.dart';
import 'package:property_ms/features/widgets/office_card.dart';
import 'package:property_ms/features/widgets/tourisem_card.dart';

class TourismDetailsController extends GetxController {
  RxDouble rating = 4.0.obs;
  final RxInt sliderIndex = 0.obs;
  var isLoadingImages = true.obs;
  RxBool isFavorite = false.obs;

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
    tourismDetails.isFavorite = isFavorite.value; // Optional: sync with model
  }

  final tourismDetails = TourismDetailModel(
    title: 'شاليه',
    description: 'هنا وصف المكان السياحي',
    publishDate: '2015/4/23',
    location: 'ريف,دمشق قدسيا',
    area: '120 م²',
    furnishing: 'مفروش',
    electricity: 'عم تتحسن',
    water: 'ساعتين الصبح',
    pool: '2 متر',
    roomDetails: RoomDetails(
      bedrooms: 2,
      livingRooms: 1,
      bathrooms: 2,
      kitchens: 1,
    ),
    images: [
      Assets.images.officePropertyCard,
      Assets.images.officeServicesCard,
      Assets.images.propertyCard,
    ],
    responsibleOffice: OfficeCardModel(
      title: 'مكتب أبو فراس',
      type: 'عقاري',
      location: 'دمشق, ميدان',
      rate: 4.75,
      image: Assets.images.propertyImage,
    ),
    features: ['موقف سيارات', 'حديقة', 'مصعد'],
    price: '\$30,000',
    payRate: 'يومياً',
    isFavorite: false,
  );

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
  ];

  void updateRating(double newRating) {
    rating.value = newRating;
    print('Updated rating: $newRating');
  }

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 2), () {
      isLoadingImages.value = false;
    });
    super.onInit();
  }
}
