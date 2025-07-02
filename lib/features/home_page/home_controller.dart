import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/features/home_page/widgets/office_card.dart';

import 'package:property_ms/features/home_page/widgets/property_rent_card.dart';
import 'package:property_ms/features/home_page/widgets/property_sale_card.dart';

class HomeController extends GetxController {
  final propertyList = [
    PropertyRentCardModel(
      title: 'شقة 100 م²',
      location: 'دمشق, شعلان',
      priceUnit: 'شهري',
      rate: 4.5,
      price: 2500,
      image: Assets.images.propertyImage,
    ),
    PropertySaleCardModel(
      title: 'بيت 120 م²',
      location: 'دمشق القديمة',
      area: 120,
      price: 2500,
      image: Assets.images.officePropertyCard,
    ),
    PropertyRentCardModel(
      title: 'شقة 120 م²',
      location: 'دمشق, أبو رمانة',
      priceUnit: 'شهري',
      rate: 4.8,
      price: 3000,
      image: Assets.images.propertyImage,
    ),
    PropertyRentCardModel(
      title: 'بيت عربي',
      location: 'دمشق القديمة',
      priceUnit: 'شهري',
      rate: 4.2,
      price: 1800,
      image: Assets.images.propertyImage,
    ),
  ];
  final topOffices = [
    OfficeCardModel(
      title: "مكتب ابو سمير",
      type: "سياحي",
      location: 'دمشق القديمة',
      rate: 4.5,
      image: Assets.images.propertyImage,
    ),
    OfficeCardModel(
      title: "مكتب ابو سمير",
      type: "سياحي",
      location: 'دمشق القديمة',
      rate: 4.5,
      image: Assets.images.propertyImage,
    ),
    OfficeCardModel(
      title: "مكتب ابو سمير",
      type: "سياحي",
      location: 'دمشق القديمة',
      rate: 4.5,
      image: Assets.images.propertyImage,
    ),
    OfficeCardModel(
      title: "مكتب ابو سمير",
      type: "سياحي",
      location: 'دمشق القديمة',
      rate: 4.5,
      image: Assets.images.propertyImage,
    ),
  ];
}
