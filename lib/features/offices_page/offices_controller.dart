import 'package:get/get.dart';
import 'package:property_ms/core/utils/assets.gen.dart';
import 'package:property_ms/features/home_page/widgets/office_card.dart';

class OfficesController extends GetxController {
  final sliderIndex = 0.obs;
  final adsSliderImages =
      <String>[
        "https://cdn.create.vista.com/downloads/61354a3a-e21b-430a-b271-b7c7a0197718_1024.jpeg",
        "https://assets.onepropertee.com/720x540/listing_images/285930354-345961094308908-6834786337806892984-n.jDQ7eZZK5ADBSnuNR.jpg",
        "https://img.freepik.com/free-psd/summer-sales-banner-template-with-colorful-triangular-shapes_23-2148151183.jpg",
        "https://img.freepik.com/free-vector/online-shopping-landing-page_23-2148789076.jpg?semt=ais_hybrid&w=740",
        "https://img.freepik.com/free-psd/flat-design-spring-sale-template_23-2150143379.jpg",
      ].obs;

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
