import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/features/property_page/sub_pages/property_details/model/property_details_model.dart';
import 'package:property_ms/features/widgets/office_card.dart';

class ComparePropertiesController extends GetxController {
  final propertyDetails = PropertyDetailsModel(
    title: "بيت أبو العود",
    description: 'هذا العقار يقع في مكان مميز جدا في حي راقي',
    publishDate: "2015/4/23",
    status: "للبيع",
    location: "ريف,دمشق قدسيا",
    area: "120 م²",
    ownershipType: "سكني",
    orientation: "جنوبية",
    furnishing: "مفروش",
    roomCount: 3,
    installmentAvailable: "متاح",
    floor: "الثالث",
    price: '\$30,000',
    isFavorite: false,
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
  );

  final propertyDetails2 = PropertyDetailsModel(
    title: "بيت نعومة",
    description: 'هذا العقار يقع في مكان مميز جدا في حي راقي',
    publishDate: "2015/4/23",
    status: "للبيع",
    location: "دمشق, الميدان",
    area: "120 م²",
    ownershipType: "سكني",
    orientation: "شمالي",
    furnishing: "سوبر ديلوكس",
    roomCount: 3,
    installmentAvailable: "متاح",
    floor: "الرابع",
    price: '\$30,000',
    isFavorite: false,

    roomDetails: RoomDetails(
      bedrooms: 2,
      livingRooms: 1,
      bathrooms: 2,
      kitchens: 1,
    ),
    images: [
      Assets.images.propertyCard,
      Assets.images.officePropertyCard,
      Assets.images.officeServicesCard,
    ],
    responsibleOffice: OfficeCardModel(
      title: 'مكتب أبو فراس',
      type: 'عقاري',
      location: 'دمشق, ميدان',
      rate: 4.75,
      image: Assets.images.propertyImage,
    ),
  );
}
