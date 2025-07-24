import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/features/tourisem_page/sub_pages/tourism_details/models/tourism_detail_model.dart';
import 'package:property_ms/features/widgets/office_card.dart';

class CompareTourismController extends GetxController {
  final tourism1 = TourismDetailModel(
    title: "شاليه البحر الأزرق",
    description: 'شاليه بإطلالة مباشرة على البحر.',
    publishDate: "2021/06/12",
    location: "طرطوس، الكورنيش",
    area: "150 م²",
    furnishing: "فاخر",
    electricity: "24/7",
    water: "متوفرة",
    pool: "خاص",
    roomDetails: RoomDetails(
      bedrooms: 2,
      livingRooms: 1,
      bathrooms: 2,
      kitchens: 1,
    ),
    images: [Assets.images.propertyCard],
    responsibleOffice: OfficeCardModel(
      title: 'مكتب البحر للعقارات',
      type: 'سياحي',
      location: 'طرطوس',
      rate: 4.9,
      image: Assets.images.propertyImage,
    ),
    features: ['شاطئ خاص', 'موقف سيارات', 'تكييف مركزي', 'مسبح'],
    price: '\$200 / ليلة',
    payRate: 'بالليلة',
    isFavorite: false,
  );

  final tourism2 = TourismDetailModel(
    title: "منتجع الجبل الأخضر",
    description: 'فيلا مميزة وسط الطبيعة الخلابة.',
    publishDate: "2021/06/15",
    location: "بلودان",
    area: "200 م²",
    furnishing: "حديث",
    electricity: "12 ساعة",
    water: "جيدة",
    pool: "مشترك",
    roomDetails: RoomDetails(
      bedrooms: 3,
      livingRooms: 1,
      bathrooms: 3,
      kitchens: 1,
    ),
    images: [Assets.images.officePropertyCard],
    responsibleOffice: OfficeCardModel(
      title: 'مكتب الجبل للسياحة',
      type: 'سياحي',
      location: 'بلودان',
      rate: 4.8,
      image: Assets.images.propertyImage,
    ),
    features: ['حديقة خاصة', 'مدفأة', 'مسبح'],
    price: '\$250 / ليلة',
    payRate: 'بالليلة',
    isFavorite: false,
  );
}
