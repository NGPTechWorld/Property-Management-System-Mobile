import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:property_ms/data/dto/office_dto.dart';
import 'package:property_ms/features/tourisem_page/sub_pages/tourism_details/models/tourism_detail_model.dart';

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
    images: [""],
    responsibleOffice: OfficeDto(
      id: 1,
      ratingCount: 4,
      name: 'مكتب البحر للعقارات',
      type: 'سياحي',
      location: 'طرطوس',
      rate: 4,
      logo: "",
    ),
    features: ['شاطئ خاص', 'موقف سيارات', 'تكييف مركزي', 'مسبح'],
    price: '\$200 / ليلة',
    payRate: 'بالليلة',
    isFavorite: false,
  );

  final tourism2 = TourismDetailModel(
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
    images: [""],
    responsibleOffice: OfficeDto(
      id: 1,
      ratingCount: 4,
      name: 'مكتب البحر للعقارات',
      type: 'سياحي',
      location: 'طرطوس',
      rate: 4,
      logo: "",
    ),
    features: ['شاطئ خاص', 'موقف سيارات', 'تكييف مركزي', 'مسبح'],
    price: '\$200 / ليلة',
    payRate: 'بالليلة',
    isFavorite: false,
  );
}
