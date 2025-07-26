import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/features/widgets/property_rent_card2_small.dart';
import 'package:property_ms/features/widgets/property_sale_card2_small.dart';

class PostDetailsController extends GetxController {
  final recommendedProperties = [
    PropertyRentCard2SmallModel(
      title: 'شقة',
      location: 'دمشق, المزة',
      priceUnit: 'شهري',
      rate: 4.5,
      price: 1800,
      image: Assets.images.property,
    ),
    PropertySaleCard2SmallModel(
      title: 'شقة',
      location: 'دمشق, أبو رمانة',
      area: 70,
      price: 3200,
      image: Assets.images.property,
    ),
    PropertyRentCard2SmallModel(
      title: 'شقة',
      location: 'دمشق, البرامكة',
      priceUnit: 'شهري',
      rate: 4.2,
      price: 2100,
      image: Assets.images.property,
    ),
    PropertySaleCard2SmallModel(
      title: 'شقة',
      location: 'دمشق, الحريقة',
      area: 90,
      price: 4000,
      image: Assets.images.property,
    ),
    PropertyRentCard2SmallModel(
      title: 'شقة',
      location: 'دمشق, المالكي',
      priceUnit: 'شهري',
      rate: 4.8,
      price: 3500,
      image: Assets.images.property,
    ),
    PropertySaleCard2SmallModel(
      title: 'شقة',
      location: 'دمشق, الشعلان',
      area: 60,
      price: 2800,
      image: Assets.images.property,
    ),
    PropertyRentCard2SmallModel(
      title: 'شقة',
      location: 'دمشق, الميدان',
      priceUnit: 'شهري',
      rate: 4.0,
      price: 1400,
      image: Assets.images.property,
    ),
    PropertySaleCard2SmallModel(
      title: 'شقة',
      location: 'دمشق, ساحة يوسف العظمة',
      area: 100,
      price: 5000,
      image: Assets.images.property,
    ),
    PropertyRentCard2SmallModel(
      title: 'شقة',
      location: 'دمشق, الصناعة',
      priceUnit: 'شهري',
      rate: 3.9,
      price: 1300,
      image: Assets.images.property,
    ),
    PropertySaleCard2SmallModel(
      title: 'شقة',
      location: 'دمشق, المزرعة',
      area: 85,
      price: 4200,
      image: Assets.images.property,
    ),
  ];
}
